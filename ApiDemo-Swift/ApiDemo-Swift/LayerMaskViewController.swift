//
//  LayerMaskViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 6/27/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class LayerMaskViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        let mainView = self.view
        let lay = CALayer()
        lay.frame = mainView.layer.bounds
        mainView.layer.addSublayer(lay)
        
        let lay1 = CALayer()
        lay1.backgroundColor = UIColor(red:1, green: 0.4, blue: 1, alpha: 1).CGColor
        lay1.frame = CGRectMake(113, 111, 132, 194)
        lay.addSublayer(lay1)
        
        let lay2 = CALayer()
        lay2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).CGColor
        lay2.frame = CGRectMake(41, 56, 132, 194)
        lay1.addSublayer(lay2)
        
        let lay3 = CALayer()
        lay3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor
        lay3.frame = CGRectMake(43, 197, 160, 230)
        lay.addSublayer(lay3)
        
        let mask = self.maskOfSize(CGSizeMake(100, 100), roundingCorners: 20)
        mask.frame.origin = CGPointMake(110, 160)
        lay.mask = mask
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
