import Cocoa

func CalculateEratosfen(size: Int) {
    
    var initArray: [Int?] = Array(0...size)
    var p = 2
    
    initArray.forEach {
        initArray[$0!*2] = nil
    }
    
}

CalculateEratosfen(size: 100)

