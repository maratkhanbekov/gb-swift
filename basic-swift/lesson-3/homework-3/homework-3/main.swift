//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum VehicleActions {
    case engineStart, engineTurnOff, windowOpen, windowClose, loadCargo, unloadCargo
}
enum ObjectsToLoad: Int, CaseIterable {
    case bicycle = 10
    case bagOfPotatoes = 30
    case cupboard = 25
}
struct Vehicle {
    let model: String // Марка авто
    let yearOfIssue: Int // Год выпуска
    
    let totalStorageCapacity: Float // Объем багажника
    
    // Объем багажника
    var currentStorageLevel: Float {
        willSet(newValue) {
            if newValue > totalStorageCapacity {
                let overLoad = abs(totalStorageCapacity-newValue)
                print("Шеф, перевес на \(overLoad)! Машина может и не поехать.")
            }
        }
    }
    
    // Содержимое багажника
    var storageObjectContainer: [ObjectsToLoad]
    
    var isEngineRunning: Bool // Запущен ли двигатель
    var isWindowsOpen: Bool // Открыты ли окна
    var isStorageLoaded: Bool // Заполненный объем багажника
    
    init(model: String = "T", yearOfIssue: Int = 1999, totalStorageCapacity: Float = 100, currentStorageLevel: Float = 0, isEngineRunning: Bool = false, isWindowsOpen: Bool = false, isStorageLoaded: Bool = false) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.totalStorageCapacity = totalStorageCapacity
        self.currentStorageLevel = currentStorageLevel
        self.storageObjectContainer = []
        self.isEngineRunning = isEngineRunning
        self.isWindowsOpen = isWindowsOpen
        self.isStorageLoaded = isStorageLoaded
    }
    
    // запустить/заглушить двигатель
    mutating func engineStart() {
        isEngineRunning = true
    }
    mutating func engineTurnOff() {
        isEngineRunning = false
    }
    
    // открыть/закрыть окна
    mutating func windowOpen() {
        isWindowsOpen = true
    }
    mutating func windowClose() {
        isWindowsOpen = false
    }
    
    
    // погрузить/выгрузить из кузова/багажника груз определенного объема
    mutating func loadCargo() {
        print("Погрузили 10 кг.")
        currentStorageLevel += 10
        
    }
    
    mutating func unloadCargo() {
        print("Выгрузили 10 кг.")
        currentStorageLevel -= 10
    }
    
    mutating func loadObject(_ object: ObjectsToLoad) {
        print("Загрузили \(object)")
        currentStorageLevel += Float(object.rawValue)
        storageObjectContainer.append(object)
    }
    
    mutating func unloadObject(_ object: ObjectsToLoad) {
        print("Выгрузили \(object)")
        currentStorageLevel -= Float(object.rawValue)
        
        if let index = storageObjectContainer.firstIndex(of: object) {
            storageObjectContainer.remove(at: index)
        }
    }
    
    mutating func command(_ action: VehicleActions) {
        switch action {
        case .engineStart:
            engineStart()
        case .engineTurnOff:
            engineTurnOff()
        case .windowOpen:
            windowOpen()
        case .windowClose:
            windowClose()
        case .loadCargo:
            loadCargo()
        case .unloadCargo:
            unloadCargo()
        }
    }
}

var car1 = Vehicle(model: "Honda Civic", yearOfIssue: 1972)
var car2 = Vehicle(model: "Ford Focus", yearOfIssue: 1998)

car1.command(.engineStart)
car1.loadObject(.bagOfPotatoes)
car1.loadObject(.bagOfPotatoes)
car1.loadCargo()
car1.loadCargo()
car1.loadCargo()
car1.loadObject(.cupboard)

car2.loadObject(.bagOfPotatoes)
car2.unloadCargo()
car2.loadCargo()
car2.loadObject(.bicycle)
car2.loadObject(.bicycle)
car2.loadObject(.bagOfPotatoes)
car2.loadObject(.cupboard)
car2.unloadCargo()

print("Загрузка машины 1 \(car1.currentStorageLevel)")
print("В багажнике: \(car1.storageObjectContainer)")
print("Загрузка машины 2 \(car2.currentStorageLevel)")
