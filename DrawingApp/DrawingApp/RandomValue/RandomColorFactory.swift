struct RandomColorFactory {
    func create() -> Color {
        let randomRange = 0..<255
        let red = Int.random(in: randomRange)
        let green = Int.random(in: randomRange)
        let blue = Int.random(in: randomRange)
        return Color(red: red, green: green, blue: blue)
    }
}
