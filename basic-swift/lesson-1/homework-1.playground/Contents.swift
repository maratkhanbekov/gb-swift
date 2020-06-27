import Foundation

func getSquaredEqSolulion(a: Float, b: Float, c: Float) {
    let D = pow(b, 2) - 4.0*a*c
    if D < 0 {
        print("D is less than zero and equals \(D), so there are no straight solutions")
    }
    else {
        let solution1 = (-b + pow(D, 1/2))/(2.0*a)
        let solution2 = (-b - pow(D, 1/2))/(2.0*a)
        print("Solution 1: \(solution1)")
        print("Solution 2: \(solution2)")
    }
}

getSquaredEqSolulion(a: 2, b: 5, c: -3)
