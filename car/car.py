class Car:
    def __init__(self, type, model, year):
        self.type = type
        self.model = model
        self.year = year
        self.mileage = 0

    def get_desc_name(self):
        desc_name = self.type + self.model + str(self.year) + "款"
        return desc_name

    def read_mileage(self):
        print("This car has been driving for " + str(self.mileage) + "km")
