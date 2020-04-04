import requests
from bs4 import BeautifulSoup
import datetime
import pandas as pd

URL = "http://www1.river.go.jp"
DAT_HEAD_ROWS = 9


class _DataPage(object):
    def __init__(self):
        self._url_base = ""
        self._kind = 1
        self.begin_date = ""
        self.end_date = ""
        self.station_id = 0

    def _gen_url(self):
        self._url = self._url_base + "KIND={}&ID={}".format(self._kind, self.station_id)
        if self._kind == 1:
            self._url += "&BGNDATE={}&ENDDATE={}".format(self.begin_date, self.end_date)

    def _grab_html(self):
        response = requests.get(self._url)
        if response.status_code == 200:
            self._html = response.content
        else:
            raise ConnectionError

    def _gen_soup(self):
        self._soup = BeautifulSoup(self._html, "html.parser")

    # we use the .dat file that the website generated automatically
    def _get_dat_url(self):
        self._dat_url = URL + self._soup.find("img", src="/img/download.gif").parent["href"]

    def _download_dat(self):
        dat = requests.get(self._dat_url)
        dat.encoding = "Shift_JIS"
        self._dat_text = dat.text

    def _dat_2_dataframe(self):
        self.df = pd.DataFrame({"datetime": [], "data": []})
        for row in self._dat_text.split("\r\n")[DAT_HEAD_ROWS:]:
            if row.endswith("#") or row.endswith("$") or row == "":
                continue
            time, data = _row_text_2_datetime_data(row)
            if data is not None and time is not None:
                self.df = self.df.append(pd.Series([time, data], index=self.df.columns), ignore_index=True)

    def _process(self):
        self._gen_url()
        self._grab_html()
        self._gen_soup()
        self._get_dat_url()
        self._download_dat()
        self._dat_2_dataframe()


class _WaterLevelDataPage(_DataPage):
    def __init__(self, station_id):
        super().__init__()
        self._url_base = "http://www1.river.go.jp/cgi-bin/DspWaterData.exe?"
        self.station_id = station_id


class WaterLevelByHourDataPage(_WaterLevelDataPage):
    def __init__(self, station_id, begin_date, end_date):
        super().__init__(station_id)
        self._kind = 1
        self.begin_date = begin_date
        self.end_date = end_date
        self._process()


class WaterLevelRealTimeDataPage(_WaterLevelDataPage):
    def __init__(self, station_id):
        super().__init__(station_id)
        self._kind = 9
        self._process()


class _RainDataPage(_DataPage):
    def __init__(self, station_id):
        super().__init__()
        self._url_base = "http://www1.river.go.jp/cgi-bin/DspRainData.exe?"
        self.station_id = station_id


class RainByHourDataPage(_RainDataPage):
    def __init__(self, station_id, begin_date, end_date):
        super().__init__(station_id)
        self._kind = 1
        self.begin_date = begin_date
        self.end_date = end_date
        self._process()


class RainRealTimeDataPage(_RainDataPage):
    def __init__(self, station_id):
        super().__init__(station_id)
        self._kind = 9
        self._process()


def _row_text_2_datetime_data(row: str):
    tmp = row.split(",")
    _fix_24_hour(tmp)
    try:
        time = datetime.datetime.strptime("{} {}".format(tmp[0], tmp[1]), "%Y/%m/%d %H:%M")
    except ValueError:
        time = None
    try:
        data = float(tmp[2])
    except ValueError:
        data = None
    return time, data


# datetime library doesn't support time like 24:00 so we have to fix it
def _fix_24_hour(row: list):
    if row[1] == "24:00":
        row[1] = "00:00"
        row[0] = _fix_date(row[0])


def _fix_date(date_str: str):
    date = datetime.datetime.strptime(date_str, "%Y/%m/%d") - datetime.timedelta(days=1)
    return date.strftime("%Y/%m/%d")
