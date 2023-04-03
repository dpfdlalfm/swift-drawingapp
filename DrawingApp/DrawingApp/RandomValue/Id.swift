import Foundation

struct Id: Hashable {
    private let id: String
    
    init(id: String) {
        self.id = id
    }
}

extension Id: CustomStringConvertible {
    var description:String {
        return "(\(id))"
    }
}
