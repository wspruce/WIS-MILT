import coordinate
import data_page
import pandas


class Station(object):
    def __init__(self, station_id):
        self.name = ""
        self.item = ""
        self.station_id = station_id
        self.address = ""
        self.coord = coordinate.Coordinate()
        self._data_page = None
        self.df = pandas.DataFrame()

    def get_data(self, kind, start_date=0, end_date=0):
        if type(self) == WaterLevelAndDisChargeStation:
            if kind == 1:
                self._data_page = data_page.WaterLevelByHourDataPage(self.station_id, start_date, end_date)
            if kind == 9:
                self._data_page = data_page.WaterLevelRealTimeDataPage(self.station_id)
        if type(self) == RainStation:
            if kind == 1:
                self._data_page = data_page.RainByHourDataPage(self.station_id, start_date, end_date)
            if kind == 9:
                self._data_page = data_page.RainRealTimeDataPage(self.station_id)
        self.df = self._data_page.df


class WaterLevelAndDisChargeStation(Station):
    def __init__(self, station_id):
        super().__init__(station_id)
        self.basin_name = ""
        self.river_name = ""
        self.tp = 0.0

    def output(self):
        info_out_put_filename = "output/観測所情報/水位流量観測所.csv"
        with open(info_out_put_filename, "a") as file:
            file.write("{},{},{},{},{},{},{}\n".format(self.station_id, self.name, self.coord.lon, self.coord.lat, self.basin_name, self.river_name, self.tp))

        data_file_name = "output/水位流量/{}.csv".format(self.name)
        self.df.to_csv(data_file_name, index=False)


class RainStation(Station):
    def __init__(self, station_id):
        super().__init__(station_id)
        self.basin_name = ""
        self.river_name = ""

    def output(self):
        info_out_put_filename = "output/観測所情報/雨量観測所.csv"
        with open(info_out_put_filename, "a") as file:
            file.write("{},{},{},{},{},{}\n".format(self.station_id, self.name, self.coord.lon, self.coord.lat, self.basin_name, self.river_name))

        data_file_name = "output/雨量/{}.csv".format(self.name)
        self.df.to_csv(data_file_name, index=False)
