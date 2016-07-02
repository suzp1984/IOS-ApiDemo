//
//  MyReverseView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/2/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class MyReverseView: UIView {

    var reverse : Bool = false
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let f = self.bounds.insetBy(dx: 10, dy: 10)
        let con = UIGraphicsGetCurrentContext()!
        if (self.reverse) {
            CGContextStrokeEllipseInRect(con, f)
        } else {
            CGContextStrokeRect(con, f)
        }
        
        self.reverse = !self.reverse
    }
}
