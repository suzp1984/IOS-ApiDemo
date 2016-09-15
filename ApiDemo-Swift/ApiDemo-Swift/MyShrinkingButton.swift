//
//  MyShrinkingButton.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

extension CGSize {
    func sizeByDelta(dw:CGFloat, dh:CGFloat) -> CGSize {
        return CGSize(width: self.width + dw, height: self.height + dh)
    }
}

class MyShrinkingButton: UIButton {
    
    override func backgroundRect(forBounds bounds: CGRect) -> CGRect {
        var result = super.backgroundRect(forBounds: bounds)
        if self.isHighlighted {
            result.insetInPlace(dx: 3, dy: 3)
        }
        
        return result
    }
    
    override var intrinsicContentSize : CGSize {
        return super.intrinsicContentSize.sizeByDelta(dw:25, dh: 20)
    }

    
}
