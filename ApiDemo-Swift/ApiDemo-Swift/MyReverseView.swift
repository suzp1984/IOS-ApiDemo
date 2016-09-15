
import UIKit

class MyReverseView: UIView {

    var reverse : Bool = false
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let f = self.bounds.insetBy(dx: 10, dy: 10)
        let con = UIGraphicsGetCurrentContext()!
        if (self.reverse) {
            con.strokeEllipse(in: f)
        } else {
            con.stroke(f)
        }
        
        self.reverse = !self.reverse
    }
}
