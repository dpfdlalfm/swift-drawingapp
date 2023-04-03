struct Color {
    var red:Int
    var green:Int
    var blue:Int
    
    init(red: Int, green: Int, blue: Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

extension Color: CustomStringConvertible {
    var description: String {
        return "R:\(red), G:\(green), B:\(blue)"
    }
}
