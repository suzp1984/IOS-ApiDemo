//
//  Layermask2ViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 6/27/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class Layermask2ViewController: UIViewController {

    let which = 2
    var iv: UIImageView!
    
    func maskOfSize(sz:CGSize, roundingCorners rad:CGFloat) -> CALayer {
        let r = CGRect(origin:CGPointZero, size:sz)
        UIGraphicsBeginImageContextWithOptions(r.size, false, 0)
        let con = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(
            con, UIColor(white:0, alpha:0).CGColor)
        CGContextFillRect(con, r)
        CGContextSetFillColorWithColor(
            con, UIColor(white:0, alpha:1).CGColor)
        let p = UIBezierPath(roundedRect:r, cornerRadius:rad)
        p.fill()
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let mask = CALayer()
        mask.frame = r
        mask.contents = im.CGImage
        return mask
    }
    
    func viewMaskOfSize(sz:CGSize, roundingCorners rad:CGFloat) -> UIView {
        let r = CGRect(origin:CGPointZero, size:sz)
        UIGraphicsBeginImageContextWithOptions(r.size, false, 0)
        let con = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(
            con, UIColor(white:0, alpha:0).CGColor)
        CGContextFillRect(con, r)
        CGContextSetFillColorWithColor(
            con, UIColor(white:0, alpha:1).CGColor)
        let p = UIBezierPath(roundedRect:r, cornerRadius:rad)
        p.fill()
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let iv = UIImageView(frame:CGRect(origin: CGPoint(), size: sz))
        iv.contentMode = .ScaleToFill
        iv.image = im
        iv.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        return iv
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.iv = UIImageView(image: UIImage(named: "Moi"))
        self.view.addSubview(self.iv)
        
        self.iv.translatesAutoresizingMaskIntoConstraints = false
        self.iv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.iv.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor).active = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        switch which {
        case 1:
            let mask = maskOfSize(self.iv.bounds.size, roundingCorners:20)
            self.iv.layer.mask = mask
        case 2:
            let mask = viewMaskOfSize(self.iv.bounds.size, roundingCorners:20)
            print(self.iv.layer.mask)
            
            self.iv.maskView = mask
            // same effect, but we've added a subview that does the masking
            // but this does not help, for instance, with the rotation problem
            // (the mask is not resized on rotation;
            // in fact, as far as I can tell, autoresizing doesn't work on the mask view)
            
            print(self.iv.layer.mask)
        default: break
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
