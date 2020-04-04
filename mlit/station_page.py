import requests
from bs4 import BeautifulSoup
import coordinate
import station
import re


class StationPage(object):
    def __init__(self, station_id):
        self._url_base = "http://www1.river.go.jp/cgi-bin/SiteInfo.exe?"
        self.station_id = station_id
        self._station_info = {}
        self._init_process()

    def _gen_url(self):
        self._url = self._url_base + "ID={}".format(self.station_id)

    def _grab_html(self):
        response = requests.get(self._url)
        if response.status_code == 200:
            self._html = response.content
        else:
            raise ConnectionError

    def _gen_soup(self):
        self._soup = BeautifulSoup(self._html, "html.parser")

    def _init_process(self):
        self._gen_url()
        self._grab_html()
        self._gen_soup()
        self._get_station_info()
        self._gen_station()

    def _get_station_info(self):
        self._station_info["station_name"] = self._soup.find("td", string="観測所名").findNext("td").get_text()
        self._station_info["item"] = self._soup.find("td", string="観測項目").findNext("td").get_text()
        if self._station_info["item"] == "水位流量" or self._station_info["item"] == "雨量":
            self._station_info["basin_name"] = self._soup.find("td", string="水系名").findNext("td").get_text()
            self._station_info["river_name"] = self._soup.find("td", string="河川名").findNext("td").get_text()
        if self._station_info["item"] == "水位流量":
            self._station_info["tp"] = self._soup.find("td", string="最新の零点高").findNext("td").get_text()
        self._station_info["address"] = self._soup.find("td", string="所在地").findNext("td").get_text()
        coord_text = self._soup.find("td", string="緯度経度").findNext("td").get_text()
        lon, lat = coordinate.coord_text_to_lonlat(coord_text)
        self._station_info["coord"] = coordinate.Coordinate()
        self._station_info["coord"].set_by_lonlat(lon, lat)

    def _gen_station(self):
        if self._station_info["item"] == "水位流量":
            self.station = station.WaterLevelAndDisChargeStation(self.station_id)
            sta_info_2_station(self._station_info, self.station)
            self.station.tp = float(re.findall(r"\d+\.?\d", self._station_info["tp"])[0])

        if self._station_info["item"] == "雨量":
            self.station = station.RainStation(self.station_id)
            sta_info_2_station(self._station_info, self.station)


def sta_info_2_station(station_info, a_station):
    a_station.name = station_info["station_name"]
    a_station.address = station_info["address"]
    a_station.item = station_info["item"]
    a_station.coord = station_info["coord"]
    a_station.basin_name = station_info["basin_name"]
    a_station.river_name = station_info["river_name"]
