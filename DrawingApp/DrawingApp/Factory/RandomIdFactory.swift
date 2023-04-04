import Foundation

struct RandomIdFactory {
    func create() -> Id {
        var uuid = UUID().uuidString.suffix(9)
        let thirdIndex = uuid.index(uuid.startIndex, offsetBy: 3)
        uuid.insert("-", at: thirdIndex)
        let sixthIndex = uuid.index(thirdIndex, offsetBy: 4)
        uuid.insert("-", at: sixthIndex)
        return Id(id: String(uuid))
    }
}
