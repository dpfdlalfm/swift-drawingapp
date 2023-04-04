enum Alpha: Double, CaseIterable {
    case one = 1,
         two,
         three,
         four,
         five,
         six,
         seven,
         eight,
         nine,
         ten
}

extension Alpha:CustomStringConvertible {
    var description:String {
        return "Alpha: \(self)"
    }
}
