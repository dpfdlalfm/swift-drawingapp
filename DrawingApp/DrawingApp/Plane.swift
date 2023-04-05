struct Plane {
    var Figures:[Figure]
    var count: Int {
        get {
            return Figures.count
        }
    }
    
    subscript(index: Int) -> Figure? {
        guard index < count else {
            return nil
        }
        return Figures[index]
    }
    
}
