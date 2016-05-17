//
//  ImageFilter1ViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/17/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class ImageFilter1ViewController: UIViewController {
    
    let iv  = UIImageView()
    let context = CIContext(options:nil)
    var filter = 0;
    
    var blendimage : CIImage! = nil
    var moiextent : CGRect! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            iv.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
            iv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 10),
            iv.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -10),
            iv.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -20)
            ])
        
        // add button
        let button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Filter", forState: .Normal)
        button.addTarget(self, action: #selector(ImageFilter1ViewController.changeFilter), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button)
        NSLayoutConstraint.activateConstraints([
            button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
            button.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -10)
            ])
        
        let moi = UIImage(named:"Moi")!
        let moici = CIImage(image:moi)!
        
        moiextent = moici.extent
        
        
        let center = CIVector(x: moiextent.width/2.0, y: moiextent.height/2.0)
        
        let smallerDimension = min(moiextent.width, moiextent.height)
        let largerDimension = max(moiextent.width, moiextent.height)
        
        // first filter
        let grad = CIFilter(name: "CIRadialGradient")!
        grad.setValue(center, forKey:"inputCenter")
        grad.setValue(smallerDimension/2.0 * 0.85, forKey:"inputRadius0")
        grad.setValue(largerDimension/2.0, forKey:"inputRadius1")
        let gradimage = grad.outputImage!
        
        
        // second filter
        blendimage = moici.imageByApplyingFilter(
            "CIBlendWithMask", withInputParameters: [
                "inputMaskImage":gradimage
            ])
        
     
        changeFilter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeFilter() -> Void {
        print("Change Filter")
        filter = filter % 3;
        switch filter {
        case 0:
            let moicg = self.context.createCGImage(self.blendimage, fromRect: self.moiextent)
            self.iv.image = UIImage(CGImage: moicg)
        case 1:
            UIGraphicsBeginImageContextWithOptions(self.moiextent.size, false, 0)
            UIImage(CIImage: self.blendimage).drawInRect(self.moiextent)
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.iv.image = im
        case 2:
            self.iv.image = UIImage(CIImage: self.blendimage) // nope
        default: break
        }

        filter += 1
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
