struct Id: Hashable {
    let id: String
    
    init(id: String) {
        self.id = id
    }
}

extension Id: CustomStringConvertible {
    var description:String {
        return "(\(id))"
    }
}
