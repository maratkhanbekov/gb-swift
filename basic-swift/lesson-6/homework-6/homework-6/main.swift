struct Queue<T> {
    private var array: [T] = []
    
    mutating func put(_ element: T) {
        array.append(element)
    }
    
    mutating func put(_ elements: [T]) {
        elements.forEach { array.append($0) }
    }
    
    mutating func get() -> T? {
        guard array.count > 0 else {
            return nil
        }
        return array.removeFirst()
    }
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var tmpArray = [T]()
        array.forEach { (T) in
            if predicate(T) {
                tmpArray.append(T)
            }
        }
        return tmpArray
    }
    
    subscript(_ index: Int) -> T? {
        return array.indices.contains(index) ? array[index] : nil
    }
}

var queue1 = Queue<Int>()
queue1.put(10)
queue1.put([11, 12])
print(queue1.get())
queue1.put([2, 4, 6, 8, 11, 17, 39, 33])

queue1.filter(){
    $0 % 2 == 0
}
queue1.filter(){
    $0 % 3 == 0
}

var queue2 = Queue<String>()
queue2.put(["apple", "orange", "banana"])
queue2.get()
queue2.filter(){
    $0.count == 6
}
print(queue2[10])


