//
//  UIViewAnimationViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 6/30/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class UIViewAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        let v1 = UIView()
        self.view.addSubview(v1)
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.widthAnchor.constraintEqualToConstant(100).active = true
        v1.heightAnchor.constraintEqualToConstant(100).active = true
        v1.backgroundColor = UIColor.blueColor()
        v1.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor).active = true
        v1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        
        UIView.animateWithDuration(2, animations: {
            v1.backgroundColor = UIColor.redColor()
        })
        
        let v2 = UIView()
        self.view.addSubview(v2)
        v2.backgroundColor = UIColor.yellowColor()
        
        v2.translatesAutoresizingMaskIntoConstraints = false
        v2.widthAnchor.constraintEqualToConstant(100).active = true
        v2.heightAnchor.constraintEqualToConstant(100).active = true
        v2.topAnchor.constraintEqualToAnchor(v1.bottomAnchor).active = true
        v2.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        
        UIView.animateWithDuration(2, animations: {
            v2.backgroundColor = UIColor.cyanColor()
            v2.center.x += 100
        })
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
