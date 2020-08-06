
import Foundation

struct Group {
    let name: String
    let image: String
    let imgCollection: [String]
}

struct GroupList {
    let groups = [
        Group(name: "Автомобили", image: "car", imgCollection: ["car"]),
        Group(name: "Музыка", image: "music", imgCollection: ["music"]),
        Group(name: "Природа", image: "nature", imgCollection: ["nature"])
    ]
    
    func getGroup(by number: Int) -> Group {
        return groups[number]
    }
    
    func numberOfGroups() -> Int {
        return groups.count
    }
}
