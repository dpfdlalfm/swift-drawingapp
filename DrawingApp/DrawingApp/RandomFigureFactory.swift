protocol RandomFigureFactory {
    init(deviceSafeArea: Point, deviceScreenSize: Size)
    func create() -> RandomFigure
}
