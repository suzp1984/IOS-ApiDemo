//
//  LayerHierarchyViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/26/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class LayerHierarchyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1).CGColor
        layer1.frame = CGRectMake(113, 111, 132, 194)
        self.view.layer.addSublayer(layer1)
        
        let layer2 = CALayer()
        layer2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).CGColor
        layer2.frame = CGRectMake(41, 56, 132, 194)
        layer1.addSublayer(layer2)
        
        let layer3 = CALayer()
        let im = UIImage(named: "smiley")!
        layer3.frame = CGRect(origin: CGPointMake(180, 180), size: im.size)
        layer3.contents = im.CGImage
        
        self.view.layer.addSublayer(layer3)
        
        let layer4 = CALayer()
        layer4.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor
        layer4.frame = CGRectMake(43, 197, 160, 230)
        self.view.layer.addSublayer(layer4)
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
