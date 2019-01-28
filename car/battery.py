class Battery:
    def __init__(self, size=100):
        self.size = size
        
    def read_battery_size(self):
        print("Size of this battery is " + str(self.size) + "kwh")

