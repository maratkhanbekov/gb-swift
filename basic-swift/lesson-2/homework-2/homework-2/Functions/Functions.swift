//
//  Functions.swift
//  homework-2
//
//  Created by Marat on 01.07.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import Foundation


//1. Написать функцию, которая определяет, четное число или нет.
func isEven(_ number: Int) -> String {
    if number % 2 == 0 {
        return "Число четное"
    }
    else {
        return "Число нечетное"
    }
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDividedWhollyInto3(_ number: Int) -> String {
    return number % 3 == 0 ? "Число делится на 3 без остатка" : "Число не делится на 3 без остатка"
}


//3. Создать возрастающий массив из 100 чисел.
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func createAndFiltedArray(_ min: Int, _ max: Int) -> [Int] {
    let basicArray: [Int] = Array(min...max)
    let filteredArray = basicArray.filter{$0%2>0 && $0%3==0}
    return filteredArray
}

//print(createAndFiltedArray(0, 100))

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func getFibonacciArray(_ elements: Int) -> [NSDecimalNumber] {
    var numbers: [NSDecimalNumber] = [.zero, .one]
    
    for i in 2...elements {
        numbers.append(numbers[i-1].adding(numbers[i-2]))
    }
    
    return numbers
}

//print(getFibonacciArray(100))
//
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

func SieveEratos(_ size: Int) -> [Int] {
    var initArray: [Int?] = Array(0...size)
    var p = 2
    
    repeat {
        for i in 2..<initArray.count where i>p*p && i*p < initArray.count {
            initArray[i*p] = nil
        }
        
        p = initArray.compactMap{$0}.filter{$0>p}.min()!
        
    } while p*p < size
    return initArray.compactMap{$0}.filter{$0>1}
}

//print(SieveEratos(100))
