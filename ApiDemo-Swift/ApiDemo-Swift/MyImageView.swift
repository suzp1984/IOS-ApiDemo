//
//  MyImageView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/12/16.
//  Copyright © 2016 suzp1984@gmail.com All rights reserved.
//

import UIKit

class MyImageView: UIView {
    
    var image : UIImage!
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.setNeedsDisplay() // causes drawRect to be called
    }
    
    override func draw(_ rect: CGRect) {
        if var im = self.image {
            if let asset = self.image.imageAsset {
                let tc = self.traitCollection
                im = asset.image(with: tc)
            }
            im.draw(at: CGPoint.zero)
        }
    }

}
