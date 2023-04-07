import Foundation

struct Plane {
    // subscript로 반환해주는 역할을 하기때문에 외부에서 직접적으로 접근하지 않고
    // Plane 내에서 알아서 하도록 하면 되겠다 생각하여 private을 추가하였습니다.
    private var rectangles:[Rectangle]
    var count: Int {
        get {
            return rectangles.count
        }
    }
    
    init() {
        self.rectangles = []
    }
    
    subscript(index: Int) -> Rectangle? {
        guard index < count else {
            return nil
        }
        return rectangles[index]
    }
    
    mutating func add(rectangle: Rectangle) {
        rectangles.append(rectangle)
    }
    
    
}
