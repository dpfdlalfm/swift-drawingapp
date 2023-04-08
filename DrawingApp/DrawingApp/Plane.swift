import Foundation

struct Plane {
    // subscript로 반환해주는 역할을 하기때문에 외부에서 직접적으로 접근하지 않고
    // Plane 내에서 알아서 하도록 하면 되겠다 생각하여 private을 추가하였습니다.
    var rectangles:Array<(Rectangle, Int)>
    var count: Int {
        get {
            return rectangles.count
        }
    }
    
    init() {
        self.rectangles = []
    }
    
    subscript(index: Int) -> (Rectangle, Int)? {
        guard index < count else {
            return nil
        }
        return rectangles[index]
    }
    
    // 포인트값을 받았을 때 해당 위치에 만약 사각형이 겹쳐있는 경우에는
    // 가장 높은 계층을 가진 뷰가 반환하도록 하였고, 어떤 모델도 없을 때는 nil을 반환하였습니다.
    func isExist(in point: CGPoint) -> Rectangle? {
        var rectanglesInPosition: Array<(Rectangle, Int)>?
        rectangles.forEach {
            let pointX = $0.0.point.x
            let pointY = $0.0.point.y
            let width = $0.0.size.width
            let height = $0.0.size.height
            if (pointX...width).contains(Double(point.x)) && (pointY...height).contains(Double(point.y)) {
                rectanglesInPosition?.append($0)
            }
        }
        
        guard let rectangle = rectanglesInPosition?.max(by: { rect1, rect2 in
            return rect1.1 > rect2.1
        }) else {
            return nil
        }
        return rectangle.0
    }
}
