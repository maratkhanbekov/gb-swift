import Foundation

//Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var model: String { get set }
    var windowPosition: WindowPositions { get set }
    var engineMode: EngineModes { get set }
    var numberOfWheels: Int { get set }
    func moveForward()
    func moveBackward()
}

// Возможные состояния
enum WindowPositions {
    case open, close, halfOpen
}
enum EngineModes {
    case turnOff, turnOn
}

//Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    mutating func handleWindow(at position: WindowPositions) {
        windowPosition = position
    }
    mutating func handleEngine(at mode: EngineModes) {
        engineMode = mode
    }
}

// Возможные состояния
enum TruckType {
    case refuseTruck, fireTruck, concreteMixer, suctionExcavator
}

//Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class TrunkCar: Car {
    var model: String
    var windowPosition: WindowPositions
    var engineMode: EngineModes
    var numberOfWheels: Int
    
    var truckType: TruckType
    var truckHeight: Float
    
    internal init(model: String, windowPosition: WindowPositions,
                  engineMode: EngineModes, numberOfWheels: Int, truckType: TruckType, truckHeight: Float) {
        self.model = model
        self.windowPosition = windowPosition
        self.engineMode = engineMode
        self.numberOfWheels = numberOfWheels
        self.truckType = truckType
        self.truckHeight = truckHeight
    }
    
    func moveForward() {
        print("Trunk Car is moving forward")
    }
    
    func moveBackward() {
        print("Trunk Car is moving backward")
    }
}

enum SportCarDrivingModes {
    case StandardMode, SportMode, EcoMode
}

class SportCar: Car {
    var model: String
    var windowPosition: WindowPositions
    var engineMode: EngineModes
    var numberOfWheels: Int
    
    var sportCarDrivingMode: SportCarDrivingModes
    var seriesNumber: Int
    
    internal init(model: String, windowPosition: WindowPositions, engineMode: EngineModes, numberOfWheels: Int, sportCarDrivingMode: SportCarDrivingModes, seriesNumber: Int) {
        self.model = model
        self.windowPosition = windowPosition
        self.engineMode = engineMode
        self.numberOfWheels = numberOfWheels
        self.sportCarDrivingMode = sportCarDrivingMode
        self.seriesNumber = seriesNumber
    }
    
    
    func moveForward() {
        print("Sport Car is moving forward")
    }
    
    func moveBackward() {
        print("Sport Car is moving backward")
    }
}

//Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
protocol CarInfo: CustomStringConvertible {
    var model: String { get }
    var engineMode: EngineModes { get }
    var windowPosition: WindowPositions { get }
}

// Стандартный description
extension CarInfo {
    var description: String {
        return "Model: \(model)\nEngine: \(engineMode)\nWindows: \(windowPosition)"
    }
}

extension TrunkCar: CarInfo {}
extension SportCar: CarInfo {
    // Кастомизированный description под SportCar
    var description: String {
        return "Model: \(model)\nEngine: \(engineMode)\nWindows: \(windowPosition)\nDriving Mode: \(sportCarDrivingMode)"
    }
}

//Создать несколько объектов каждого класса. Применить к ним различные действия.
var trunkCar1 = TrunkCar(model: "Transporter", windowPosition: .open, engineMode: .turnOn, numberOfWheels: 8, truckType: .suctionExcavator, truckHeight: 320)
var sportCart1 = SportCar(model: "ZondaF", windowPosition: .halfOpen, engineMode: .turnOn, numberOfWheels: 4, sportCarDrivingMode: .SportMode, seriesNumber: 11022)

trunkCar1.handleWindow(at: .halfOpen)
sportCart1.handleEngine(at: .turnOff)


//Вывести сами объекты в консоль.
print("===============")
print(trunkCar1)
print("===============")
print(sportCart1)
print("===============")
