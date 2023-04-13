struct RandomColorFactory {
    static func createColor() -> Color {
        let randomRange = 0...255.0
        let red = Double.random(in: randomRange)
        let green = Double.random(in: randomRange)
        let blue = Double.random(in: randomRange)
        return Color(red: red, green: green, blue: blue)
    }
}
