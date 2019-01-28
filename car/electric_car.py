import car
import battery


class ElectricCar(car.Car):
    def __init__(self, type, model, year):
        super().__init__(type, model, year)
        self.battery = battery.Battery()


electric_car = ElectricCar("特斯拉", "Model S", 2016)
print(electric_car.get_desc_name())
electric_car.read_mileage()
electric_car.battery.read_battery_size()
