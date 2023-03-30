protocol RandomViewFactory {
    init(deviceSafeArea: Point, deviceScreen: Size)
    func makeView() -> RandomFigureView
}
