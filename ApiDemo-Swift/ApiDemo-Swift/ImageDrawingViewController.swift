//
//  ImageDrawingViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/16/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageDrawingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let iv1 = UIImageView()
        let iv2 = UIImageView()
        let iv3 = UIImageView()
        let iv4 = UIImageView()
        let iv5 = UIImageView()
        let iv6 = UIImageView()
        let iv7 = UIImageView()
        
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv2.translatesAutoresizingMaskIntoConstraints = false
        iv3.translatesAutoresizingMaskIntoConstraints = false
        iv4.translatesAutoresizingMaskIntoConstraints = false
        iv5.translatesAutoresizingMaskIntoConstraints = false
        iv6.translatesAutoresizingMaskIntoConstraints = false
        iv7.translatesAutoresizingMaskIntoConstraints = false
        
        iv1.widthAnchor.constraintEqualToConstant(106).active = true
        iv1.heightAnchor.constraintEqualToConstant(54).active = true
        iv2.widthAnchor.constraintEqualToConstant(106).active = true
        iv2.heightAnchor.constraintEqualToConstant(106).active = true
        iv3.widthAnchor.constraintEqualToConstant(106).active = true
        iv3.heightAnchor.constraintEqualToConstant(54).active = true
        iv4.widthAnchor.constraintEqualToConstant(106).active = true
        iv4.heightAnchor.constraintEqualToConstant(54).active = true
        iv5.widthAnchor.constraintEqualToConstant(106).active = true
        iv5.heightAnchor.constraintEqualToConstant(54).active = true
        iv6.widthAnchor.constraintEqualToConstant(106).active = true
        iv6.heightAnchor.constraintEqualToConstant(54).active = true
        iv7.widthAnchor.constraintEqualToConstant(106).active = true
        iv7.heightAnchor.constraintEqualToConstant(54).active = true
        
        self.view.addSubview(iv1)
        self.view.addSubview(iv2)
        self.view.addSubview(iv3)
        self.view.addSubview(iv4)
        self.view.addSubview(iv5)
        self.view.addSubview(iv6)
        self.view.addSubview(iv7)
        
        let vs = ["iv1":iv1, "iv2":iv2, "iv3": iv3, "iv4": iv4, "iv5": iv5, "iv6":iv6, "iv7": iv7, "tlg":self.topLayoutGuide]
        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(10)-[iv1]-(10)-[iv3]-(10)-[iv4]-(10)-[iv5]-(10)-[iv6]-(10)-[iv7]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(10)-[iv2]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv1]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:[iv2]-(10)-|", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv3]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv4]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv5]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv6]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv7]", options: [], metrics: nil, views: vs as! [String : AnyObject])
            ].flatMap{$0})
        
//        NSLayoutConstraint.activateConstraints([
//            iv1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv1.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
//            iv2.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: 20),
//            iv2.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
//            iv3.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv3.topAnchor.constraintEqualToAnchor(iv1.bottomAnchor, constant: 20),
//            iv4.topAnchor.constraintEqualToAnchor(iv3.bottomAnchor, constant: 20),
//            iv4.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv5.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv5.topAnchor.constraintEqualToAnchor(iv4.bottomAnchor, constant: 20),
//            iv6.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv6.topAnchor.constraintEqualToAnchor(iv5.bottomAnchor, constant: 20),
//            iv7.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv7.topAnchor.constraintEqualToAnchor(iv6.bottomAnchor, constant: 20)
//            ])
        
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            UIGraphicsBeginImageContextWithOptions(
                CGSizeMake(sz.width*2, sz.height), false, 0)
            mars.drawAtPoint(CGPointMake(0,0))
            mars.drawAtPoint(CGPointMake(sz.width,0))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            iv1.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            UIGraphicsBeginImageContextWithOptions(
                CGSizeMake(sz.width*2, sz.height*2), false, 0)
            mars.drawInRect(CGRectMake(0,0,sz.width*2, sz.height*2))
            mars.drawInRect(CGRectMake(sz.width/2.0, sz.height/2.0, sz.width, sz.height), blendMode: .Multiply, alpha: 1.0)
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            iv2.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            UIGraphicsBeginImageContextWithOptions(
                CGSizeMake(sz.width/2.0, sz.height), false, 0)
            mars.drawAtPoint(CGPointMake(-sz.width/2.0,0))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            iv3.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            // extract each half as CGImage
            let marsCG = mars.CGImage
            let sz = mars.size
            let marsLeft = CGImageCreateWithImageInRect(
                marsCG,
                CGRectMake(0,0,sz.width/2.0,sz.height))
            let marsRight = CGImageCreateWithImageInRect(
                marsCG,
                CGRectMake(sz.width/2.0,0,sz.width/2.0,sz.height))
            // draw each CGImage
            UIGraphicsBeginImageContextWithOptions(
                CGSizeMake(sz.width*1.5, sz.height), false, 0)
            let con = UIGraphicsGetCurrentContext()!
            CGContextDrawImage(con,
                               CGRectMake(0,0,sz.width/2.0,sz.height), marsLeft)
            CGContextDrawImage(con,
                               CGRectMake(sz.width,0,sz.width/2.0,sz.height), marsRight)
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv4.image = im
            // flipped!
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            // extract each half as CGImage
            let sz = mars.size
            let marsCG = mars.CGImage
            let marsLeft = CGImageCreateWithImageInRect(
                marsCG,
                CGRectMake(0,0,sz.width/2.0,sz.height))
            let marsRight = CGImageCreateWithImageInRect(
                marsCG,
                CGRectMake(sz.width/2.0,0,sz.width/2.0,sz.height))
            // draw each CGImage flipped
            UIGraphicsBeginImageContextWithOptions(
                CGSizeMake(sz.width*1.5, sz.height), false, 0)
            let con = UIGraphicsGetCurrentContext()!
            CGContextDrawImage(con,
                               CGRectMake(0,0,sz.width/2.0,sz.height), flip(marsLeft!))
            CGContextDrawImage(con,
                               CGRectMake(sz.width,0,sz.width/2.0,sz.height), flip(marsRight!))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv5.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            let marsCG = mars.CGImage
            let szCG = CGSizeMake(CGFloat(CGImageGetWidth(marsCG)), CGFloat(CGImageGetHeight(marsCG)))
            let marsLeft =
                CGImageCreateWithImageInRect(
                    marsCG, CGRectMake(0,0,szCG.width/2.0,szCG.height))
            let marsRight =
                CGImageCreateWithImageInRect(
                    marsCG, CGRectMake(szCG.width/2.0,0,szCG.width/2.0,szCG.height))
            UIGraphicsBeginImageContextWithOptions(
                CGSizeMake(sz.width*1.5, sz.height), false, 0)
            // the rest as before, draw each CGImage flipped
            let con = UIGraphicsGetCurrentContext()!
            CGContextDrawImage(con,
                               CGRectMake(0,0,sz.width/2.0,sz.height), flip(marsLeft!))
            CGContextDrawImage(con,
                               CGRectMake(sz.width,0,sz.width/2.0,sz.height), flip(marsRight!))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv6.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            let marsCG = mars.CGImage
            let szCG = CGSizeMake(CGFloat(CGImageGetWidth(marsCG)), CGFloat(CGImageGetHeight(marsCG)))
            let marsLeft =
                CGImageCreateWithImageInRect(
                    marsCG, CGRectMake(0,0,szCG.width/2.0,szCG.height))
            let marsRight =
                CGImageCreateWithImageInRect(
                    marsCG, CGRectMake(szCG.width/2.0,0,szCG.width/2.0,szCG.height))
            UIGraphicsBeginImageContextWithOptions(
                CGSizeMake(sz.width*1.5, sz.height), false, 0)
            // instead of calling flip, pass through UIImage
            UIImage(CGImage: marsLeft!, scale: mars.scale,
                orientation: mars.imageOrientation)
                .drawAtPoint(CGPointMake(0,0))
            UIImage(CGImage: marsRight!, scale: mars.scale,
                orientation: mars.imageOrientation)
                .drawAtPoint(CGPointMake(sz.width,0))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv7.image = im
        }

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
    
    func flip (im: CGImage) -> CGImage {
        let sz = CGSizeMake(CGFloat(CGImageGetWidth(im)), CGFloat(CGImageGetHeight(im)))
        UIGraphicsBeginImageContextWithOptions(sz, false, 0)
        CGContextDrawImage(UIGraphicsGetCurrentContext()!,
                           CGRectMake(0, 0, sz.width, sz.height), im)
        let result = UIGraphicsGetImageFromCurrentImageContext().CGImage
        UIGraphicsEndImageContext()
        return result!
    }


}
