//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

protocol Movable {
    var currentFloor: Int { get set }
    func move(to floor: Int) -> (String?, ElevatorErrors?)
}

protocol Storable {
    var minStore: Int {get set}
    var maxStore: Int {get set}
}

enum ElevatorErrors: Error {
    case noFloorBelow(minStore: Int)
    case noFloorAbove(maxStore: Int)
    case sameFloor(floor: Int)
    
    var errorDescription: String? {
        switch self {
        case .noFloorBelow(let minStore):
            return "Минимальный этаж в здании \(minStore)"
        case .noFloorAbove(let maxStore):
            return "Максимальный этаж в здании \(maxStore)"
        case .sameFloor(let floor):
            return "Вы уже находитесь на \(floor) этаже"
        }
        
    }
}

class Otis: Movable, Storable {
    
    var currentFloor: Int
    var minStore: Int
    var maxStore: Int
    
    internal init(currentFloor: Int, minStore: Int, maxStore: Int) {
        self.currentFloor = currentFloor
        self.minStore = minStore
        self.maxStore = maxStore
    }
    
    func move(to floor: Int) -> (String?, ElevatorErrors?) {
        
        let proposedFloor = floor
        
        guard proposedFloor <= maxStore else {
            return (nil, .noFloorAbove(maxStore: maxStore))
        }
        
        guard proposedFloor >= minStore else {
            return (nil, .noFloorBelow(minStore: minStore))
        }
        
        guard proposedFloor != currentFloor else {
            return (nil, .sameFloor(floor: currentFloor))
        }
        
        self.currentFloor = proposedFloor
        
        return ("Лифт переместился на \(currentFloor) этаж", nil)
    }
    
}

func messageDisplay(_ result: (String?, ElevatorErrors?)) {
    if let success = result.0 {
        print(success)
    }
    else {
        print(result.1?.errorDescription ?? "Неизвестная ошибка")
    }
}

var otis1 = Otis(currentFloor: 0, minStore: -4, maxStore: 24)
messageDisplay(otis1.move(to: 10))
messageDisplay(otis1.move(to: 10))
messageDisplay(otis1.move(to: -54))
messageDisplay(otis1.move(to: 204))
messageDisplay(otis1.move(to: 24))


//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum AccountErrors: Error {
    case insufficientFunds
    case accountBlocked
    var errorDescription: String? {
        switch self {
        case .insufficientFunds:
            return "Недостаточно денег на счету"
        case .accountBlocked:
        return "Счет заблокирован"
        }
    }
}

enum CentralBankErrors: Error {
    case accountIsNotFound
    var errorDescription: String? {
        switch self {
        case .accountIsNotFound:
            return "Счет не найден"
        }
    }
}


protocol Accountable {
    var balance: Float { get set }
    var isActive: Bool { get set }
}
protocol CashWithdrawable {
    func getBalance(accountNumber: Int) throws -> Float
    func cashWithdraw(accountNumber: Int, amount: Float) throws -> Float
}

class Account: Accountable {
    var number: Int
    var balance: Float
    var isActive: Bool
    
    internal init(number: Int, balance: Float, isActive: Bool) {
        self.number = number
        self.balance = balance
        self.isActive = isActive
    }
}

struct CentralBank {
    var country: String
    var currentAccounts = [Account]()
    
    func getAccount(_ accountNumber: Int) throws -> Account {
        guard let account = currentAccounts.first(where: { $0.number == accountNumber}) else {
            throw CentralBankErrors.accountIsNotFound
        }
        return account
    }
    
    func transDebit(from accountNumber: Int, amount: Float) throws -> String {

        let account = try self.getAccount(accountNumber)
        
        guard account.isActive == true else {
            throw AccountErrors.accountBlocked
        }
        
        guard account.balance - amount > 0 else {
            throw AccountErrors.insufficientFunds
        }
        
        return "Списано \(amount) со счета \(account.number)"
        
    }
}

var account1 = Account(number: 110022112, balance: 100, isActive: true)
var account2 = Account(number: 110022113, balance: 58.3, isActive: true)


var russianCentralBank = CentralBank(country: "Russia", currentAccounts: [account1, account2])

// Поиск не существующего счета
do {
    let operation1 = try russianCentralBank.transDebit(from: 110022110, amount: 50)
    print(operation1)
}
catch CentralBankErrors.accountIsNotFound {
    print(CentralBankErrors.accountIsNotFound.errorDescription ?? "accountIsNotFound")
}
catch AccountErrors.insufficientFunds {
    print(AccountErrors.insufficientFunds.errorDescription ?? "insufficientFunds")
}
catch AccountErrors.accountBlocked {
    print(AccountErrors.accountBlocked.errorDescription ?? "accountBlocked")
}

// Транзакция на сумму больше, чем есть на счету
do {
    let operation2 = try russianCentralBank.transDebit(from: 110022112, amount: 200)
    print(operation2)
}
catch CentralBankErrors.accountIsNotFound {
    print(CentralBankErrors.accountIsNotFound.errorDescription ?? "accountIsNotFound")
}
catch AccountErrors.insufficientFunds {
    print(AccountErrors.insufficientFunds.errorDescription ?? "insufficientFunds")
}
catch AccountErrors.accountBlocked {
    print(AccountErrors.accountBlocked.errorDescription ?? "accountBlocked")
}
