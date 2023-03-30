import Foundation

struct RandomId {
    let id: String
    
    init() {
        var uuid = UUID().uuidString.suffix(9)
        let thirdIndex = uuid.index(uuid.startIndex, offsetBy: 2)
        uuid.insert("-", at: thirdIndex)
        let sixthIndex = uuid.index(uuid.startIndex, offsetBy: 6)
        uuid.insert("-", at: sixthIndex)
        self.id = String(uuid)
    }
}

extension RandomId: CustomStringConvertible {
    var description:String {
        return "(\(id))"
    }
}
