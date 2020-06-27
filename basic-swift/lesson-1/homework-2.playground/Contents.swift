import Foundation

func getTriagleInfo(cathet1: Float, cathet2: Float) {
    let hypotenuse: Float = pow(pow(cathet1, 2) + pow(cathet2, 2), 1/2)
    let square: Float = cathet1*cathet2/2
    let perimeter: Float = cathet1 + cathet2 + hypotenuse
    
    print("Square: \(square)")
    print("Perimeter: \(perimeter)")
    print("Hypotenuse: \(hypotenuse)")
}

getTriagleInfo(cathet1: 3, cathet2: 4)
