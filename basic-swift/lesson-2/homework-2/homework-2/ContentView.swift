//
//  ContentView.swift
//  homework-2
//
//  Created by Marat on 01.07.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var input1 = ""
    @State var showResult1: Bool = false
    
    @State var input2 = ""
    @State var showResult2: Bool = false
    
    @State var input3_min = ""
    @State var input3_max = ""
    @State var showResult3: Bool = false
    
    @State var input4 = ""
    @State var showResult4: Bool = false
    
    @State var input5 = ""
    @State var showResult5: Bool = false

    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Написать функцию, которая определяет, четное число или нет.")) {
                    
                    TextField("Введите число", text: $input1)
                        
                        .keyboardType(.decimalPad)
                    
                    Button("Запустить") {
                        self.showResult1 = true
                    }
                    .alert(isPresented: $showResult1) {
                        
                        guard let input1_number = Int(input1) else {
                            return Alert(title: Text("Введите число"), dismissButton: .default(Text("OK")))
                        }
                        
                        let result = isEven(input1_number)
                        
                        return Alert(title: Text("\(result)"), dismissButton: .default(Text("OK")))
                    }
                }
                
                
                
                Section(header: Text("Написать функцию, которая определяет, делится ли число без остатка на 3.")) {
                    
                    TextField("Введите число", text: $input2)
                        
                        .keyboardType(.decimalPad)
                    
                    Button("Запустить") {
                        self.showResult2 = true
                    }
                    .alert(isPresented: $showResult2) {
                        
                        guard let input2_number = Int(input2) else {
                            return Alert(title: Text("Введите число"), dismissButton: .default(Text("OK")))
                        }
                        
                        let result = isDividedWhollyInto3(input2_number)
                        
                        return Alert(title: Text("\(result)"), dismissButton: .default(Text("OK")))
                    }
                }
                
                Section(header: Text("3. Создать возрастающий массив из 100 чисел. \n4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")) {
                    
                    TextField("Введите начало диапазона", text: $input3_min)
                        .keyboardType(.decimalPad)
                    TextField("Введите конец диапазона", text: $input3_max)
                        .keyboardType(.decimalPad)
                    
                    Button("Запустить") {
                        self.showResult3 = true
                    }
                    .alert(isPresented: $showResult3) {
                        
                        guard let input3_min_number = Int(input3_min), let input3_max_number = Int(input3_max) else {
                            return Alert(title: Text("Введите число"), dismissButton: .default(Text("OK")))
                        }
                        
                        let result = createAndFiltedArray(input3_min_number, input3_max_number)
                        let resultMessage = result.map{String($0)}.joined(separator:", ")
                        return Alert(title: Text("Числа из диапазона, которые не делятся на 2 и на 3"),
                                     message: Text(resultMessage),
                                     dismissButton: .default(Text("OK")))
                    }
                }
                
                
                
                Section(header: Text("Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов")) {
                    
                    TextField("Введите номер числа Фибоначи", text: $input4)
                        
                        .keyboardType(.decimalPad)
                    
                    Button("Запустить") {
                        self.showResult4 = true
                    }
                    .alert(isPresented: $showResult4) {
                        
                        guard let input4_number = Int(input4) else {
                            return Alert(title: Text("Введите число"), dismissButton: .default(Text("OK")))
                        }
                        
                        let result = getFibonacciArray(input4_number)
//                        let resultMessage = result.map{String($0)}.joined(separator:", ")
                        
                        return Alert(title: Text("Число Фибоначи"),
                                     message: Text("\(result[input4_number])"), dismissButton: .default(Text("OK")))
                    }
                }
                
                
                
                Section(header: Text("Найти простые числа для диапазона чисел")) {
                    
                    TextField("Введите верхнюю границу диапазона", text: $input5)
                        
                        .keyboardType(.decimalPad)
                    
                    Button("Запустить") {
                        self.showResult5 = true
                    }
                    .alert(isPresented: $showResult5) {
                        
                        guard let input5_number = Int(input5) else {
                            return Alert(title: Text("Введите число"), dismissButton: .default(Text("OK")))
                        }
                        
                        let result = SieveEratos(input5_number)
                        let resultMessage = result.map{String($0)}.joined(separator:", ")
                        
                        return Alert(title: Text("Полученный массив"),
                        message: Text(resultMessage), dismissButton: .default(Text("OK")))
                    }
                }
                
                
                
            }.navigationBarTitle("Домашняя работа")
            
            
            
            
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
