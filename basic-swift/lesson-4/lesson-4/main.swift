//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum engineType {
    case petrol, diesel, electric
}

enum turnMode {
    case on, off
}

enum CarActions {
    case engineStart, engineTurnOff
}

enum ObjectsToLoad: Int, CaseIterable {
    case bicycle = 10
    case bagOfPotatoes = 30
    case cupboard = 25
}

class Car {
    let model: String
    let yearOfIssue: Int
    let numberOfWheels: Int
    let numberOfSeats: Int
    let storageCapacity: Float
    let fuelTankCapacity: Float
    var fuelTankLevel: Float
    let engineType: engineType
    var engineMode: turnMode
    var driver: Driver?
    
    // Объем багажника
    var currentStorageLevel: Float {
        willSet(newValue) {
            if newValue > storageCapacity {
                let overLoad = abs(storageCapacity - newValue)
                print("Шеф, перевес на \(overLoad)! Машина может и не поехать.")
            }
        }
    }
    
    // Содержимое багажника
    var storageObjectContainer: [ObjectsToLoad]
    
    init(model: String, yearOfIssue: Int, numberOfWheels: Int, numberOfSeats: Int, storageCapacity: Float, currentStorageLevel: Float, fuelTankCapacity: Float, fuelTankLevel: Float, engineType: engineType, engineMode: turnMode, driver: Driver?, storageObjectContainer: [ObjectsToLoad]) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.numberOfWheels = numberOfWheels
        self.numberOfSeats = numberOfSeats
        self.storageCapacity = storageCapacity
        self.currentStorageLevel = currentStorageLevel
        self.fuelTankCapacity = fuelTankCapacity
        self.fuelTankLevel = fuelTankLevel
        self.engineType = engineType
        self.engineMode = engineMode
        self.driver = driver
        self.storageObjectContainer = storageObjectContainer
    }
    
    
    // запустить/заглушить двигатель
    func engineStart() {
        self.engineMode = .on
    }
    final func engineTurnOff() {
        self.engineMode = .off
    }
    
    func fillUpTank(with volume: Float) {
        self.fuelTankLevel = self.fuelTankLevel + volume
    }
    
    func loadObject(_ object: ObjectsToLoad) {
        print("Load \(object)")
        currentStorageLevel += Float(object.rawValue)
        storageObjectContainer.append(object)
    }
    
    func unloadObject(_ object: ObjectsToLoad) {
        print("Unload \(object)")
        currentStorageLevel -= Float(object.rawValue)
        
        if let index = storageObjectContainer.firstIndex(of: object) {
            storageObjectContainer.remove(at: index)
        }
    }
    
    func command(_ action: CarActions) {
        switch action {
        case .engineStart:
            print("Engine is started")
            engineStart()
        case .engineTurnOff:
            print("Engine is turned off")
            engineTurnOff()
        }
    }
}

var car1 = Car(model: "T", yearOfIssue: 2000, numberOfWheels: 4, numberOfSeats: 5, storageCapacity: 200, currentStorageLevel: 40, fuelTankCapacity: 40, fuelTankLevel: 4, engineType: .diesel, engineMode: .off, driver: nil, storageObjectContainer: [.bagOfPotatoes])

car1.command(.engineStart)

enum TruckType {
    case refuseTruck, fireTruck, concreteMixer, suctionExcavator
}

enum TruckCarActions {
    case loadCargo, unloadCargo
}

class TruckCar: Car {
    
    var truckType: TruckType
    var truckHeight: Float
    
    internal init(truckType: TruckType, truckHeight: Float,
                  model: String, yearOfIssue: Int, numberOfWheels: Int, numberOfSeats: Int, storageCapacity: Float, currentStorageLevel: Float, fuelTankCapacity: Float, fuelTankLevel: Float, engineType: engineType, engineMode: turnMode, driver: Driver?, storageObjectContainer: [ObjectsToLoad]) {
        
        self.truckType = truckType
        self.truckHeight = truckHeight
        
        super.init(model: model, yearOfIssue: yearOfIssue, numberOfWheels: numberOfWheels, numberOfSeats: numberOfSeats, storageCapacity: storageCapacity, currentStorageLevel: currentStorageLevel, fuelTankCapacity: fuelTankCapacity, fuelTankLevel: fuelTankLevel, engineType: engineType, engineMode: engineMode, driver: driver, storageObjectContainer: storageObjectContainer)
    }
    
    
    func command(_ action: TruckCarActions) {
        switch action {
        case .loadCargo:
            self.loadCargo()
        case .unloadCargo:
            self.unloadCargo()
        }
    }
    
    override func engineStart() {
        print("Warm your truck before you go")
        self.engineMode = .on
    }
    
    func loadCargo() {
        print("Load 10 kg.")
        currentStorageLevel += 10
    }
    func unloadCargo() {
        print("Unload 10 kg.")
        currentStorageLevel -= 10
    }
}

var truck1 = TruckCar(truckType: .fireTruck, truckHeight: 248, model: "Kamaz", yearOfIssue: 1987, numberOfWheels: 8, numberOfSeats: 2, storageCapacity: 1000, currentStorageLevel: 40, fuelTankCapacity: 100, fuelTankLevel: 99, engineType: .petrol, engineMode: .on, driver: nil, storageObjectContainer: [.bicycle])

print(truck1.numberOfSeats)
truck1.command(.engineTurnOff)
truck1.command(.engineStart)
print(truck1.engineMode)
truck1.command(.loadCargo)

enum SportCarDrivingModes {
    case StandardMode, SportMode, EcoMode
}

class SportСar: Car {
    
    var sportCarDrivingMode: SportCarDrivingModes
    var seriesNumber: Int
    
    internal init(sportCarDrivingMode: SportCarDrivingModes, seriesNumber: Int, model: String, yearOfIssue: Int, numberOfWheels: Int, numberOfSeats: Int, storageCapacity: Float, currentStorageLevel: Float, fuelTankCapacity: Float, fuelTankLevel: Float, engineType: engineType, engineMode: turnMode, driver: Driver?, storageObjectContainer: [ObjectsToLoad]) {
        
        self.sportCarDrivingMode = sportCarDrivingMode
        self.seriesNumber = seriesNumber
        
        super.init(model: model, yearOfIssue: yearOfIssue, numberOfWheels: numberOfWheels, numberOfSeats: numberOfSeats, storageCapacity: storageCapacity, currentStorageLevel: currentStorageLevel, fuelTankCapacity: fuelTankCapacity, fuelTankLevel: fuelTankLevel, engineType: engineType, engineMode: engineMode, driver: driver, storageObjectContainer: storageObjectContainer)
    }
    
    func switchDrivingMode(to mode: SportCarDrivingModes) {
        self.sportCarDrivingMode = mode
        print("Driving mode is changed")
    }
    
}

var sportcar1 = SportСar(sportCarDrivingMode: .EcoMode, seriesNumber: 1992001, model: "Kamaz", yearOfIssue: 1987, numberOfWheels: 8, numberOfSeats: 2, storageCapacity: 1000, currentStorageLevel: 40, fuelTankCapacity: 100, fuelTankLevel: 99, engineType: .petrol, engineMode: .on, driver: driver1, storageObjectContainer: [.bicycle])

sportcar1.switchDrivingMode(to: .SportMode)


class Driver {
    weak var car: Car?
    
    init(car: Car?) {
        self.car = car
    }
}

var driver1 = Driver(car: nil)
sportcar1.driver = driver1
