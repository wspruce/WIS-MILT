import re

import requests
from bs4 import BeautifulSoup


def _is_pages_in_the_string(s):
    return "全部" in s


class MLITResultPage(object):
    def __init__(self, item=-1, basin=-1, prefecture=-1):
        self._url_base = "http://www1.river.go.jp/cgi-bin/SrchSite.exe?"
        self._item = item
        self._basin = basin
        self._prefecture = prefecture
        self._init_process()

    def _gen_url(self, page=0):
        self._url = self._url_base + "KOMOKU={}&SUIKEI={}&KEN={}&PAGE={}".format(self._item,
                                                                                 self._basin,
                                                                                 self._prefecture,
                                                                                 page)

    def _grab_html(self):
        response = requests.get(self._url)
        if response.status_code == 200:
            self._html = response.content
        else:
            raise ConnectionError

    def _gen_soup(self):
        self._soup = BeautifulSoup(self._html, "html.parser")

    def _get_page_num(self):
        result_num_line = self._soup.find(string=_is_pages_in_the_string)  # 「全部で○○件がみつかりました」の所から行数を取得
        self._page_num = int(int(re.findall(r"\d+", result_num_line)[0]) / 10) + 1  # ページ数を抽出

    def _get_stations_to_dict(self):
        self.station_dict = {}
        for i in range(0, self._page_num):
            if i > 0:
                self._gen_url(i)
                self._grab_html()
                self._gen_soup()
            table = self._soup.find_all("a", href=True, string=True)  # 表を探し出す
            for line in table:
                name = line.get_text()  # 観測所名
                href = str(line["href"])  # URL
                station_id = href.split("'")[1]  # 観測所ID
                self.station_dict[name] = station_id

    def _init_process(self):
        self._gen_url()
        self._grab_html()
        self._gen_soup()
        self._get_page_num()
        self._get_stations_to_dict()
