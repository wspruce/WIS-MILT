import re


class Coordinate(object):
    def __init__(self):
        self.lon = 0.0
        self.lat = 0.0
        self.x = 0.0
        self.y = 0.0

    def set_by_lonlat(self, lon, lat):
        self.lon = lon
        self.lat = lat
        self._convert2xy()

    def set_by_xy(self, x, y):
        self.x = x
        self.y = y
        self._convert2lonlat()

    # TODO: converting functions may be needed in the future
    def _convert2xy(self):
        pass

    def _convert2lonlat(self):
        pass


def coord_text_to_lonlat(coord_text):
    coord_list = re.findall(r"\d+", coord_text)
    coord_list = list(map(float, coord_list))
    lon = coord_list[0] + coord_list[1]/60.0 + coord_list[2]/3600.0
    lat = coord_list[3] + coord_list[4]/60.0 + coord_list[5]/3600.0
    return lon, lat
