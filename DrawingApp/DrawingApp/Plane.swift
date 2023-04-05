struct Plane {
    private var figures:[Figure]
    private var count: Int {
        get {
            return figures.count
        }
    }
    
    init() {
        self.figures = []
    }
    
    subscript(index: Int) -> Figure? {
        guard index < count else {
            return nil
        }
        return figures[index]
    }
    
    mutating func add(figure: Figure) {
        figures.append(figure)
    }
}
