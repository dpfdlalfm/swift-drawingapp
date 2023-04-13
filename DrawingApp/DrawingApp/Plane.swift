import Foundation

class Plane {
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
    
    func add(element: Rectangle) {
        self.rectangles.append(element)
    }
    
    func changeAlpha(indices: [Int], with value: Double) {
        indices.forEach {
            if let newAlpha = Alpha(rawValue: value) {
                rectangles[$0].alpha = newAlpha
            }
        }
    }
    
    func changeColor(indicies: [Int], with value: Color) {
        indicies.forEach {
            rectangles[$0].color = value
        }
    }
    
    // 포인트값을 받았을 때 해당 위치에 만약 사각형이 있는 경우에는
    // Optional 타입의 CGPoint를 반환, 어떤 모델도 없을 때는 nil을 반환하였습니다.
    func isExist(in point: CGPoint) -> CGPoint? {
        var result = false
        rectangles.forEach {
            let pointX = $0.point.x
            let pointY = $0.point.y
            let width = $0.size.width
            let height = $0.size.height
            if (pointX...pointX + width).contains(point.x)
                && (pointY...pointY + height).contains(point.y) {
                result = true
                return
            }
        }
        
        guard result else {
            return nil
        }
        return point
    }
}
