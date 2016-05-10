//
//  ConstraintSwapViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/9/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class ConstraintSwapViewController: UIViewController {
    var v1 : UIView!
    var v2 : UIView!
    var v3 : UIView!
    var constraintsWith = [NSLayoutConstraint]()
    var constraintsWithout = [NSLayoutConstraint]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // add swap button
        let button = UIButton(type: UIButtonType.System) as UIButton
        // button.frame = CGRectMake(100, 100, 50, 50)
        button.backgroundColor =  UIColor.greenColor()
        button.setTitle("Swap", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(ConstraintSwapViewController.swapContraint), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let d = ["b" : button]
        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[b]", options: [], metrics: nil, views: d),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|-(80)-[b]", options: [], metrics: nil, views: d)
            ].flatten().map{$0})
        
        // add custom UIView
        let v1 = UIView()
        v1.backgroundColor = UIColor.redColor()
        v1.translatesAutoresizingMaskIntoConstraints = false
        let v2 = UIView()
        v2.backgroundColor = UIColor.yellowColor()
        v2.translatesAutoresizingMaskIntoConstraints = false
        let v3 = UIView()
        v3.backgroundColor = UIColor.blueColor()
        v3.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(v1)
        self.view.addSubview(v2)
        self.view.addSubview(v3)
        
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        
        let c1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v" : v1])
        let c2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v" : v2])
        let c3 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v" : v3])
        let c4 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(200)-[v(20)]", options: [], metrics: nil, views: ["v" : v1])
        let c5with = NSLayoutConstraint.constraintsWithVisualFormat("V:[v1]-(20)-[v2(20)]-(20)-[v3(20)]", options: [], metrics: nil, views: ["v1":v1, "v2":v2, "v3":v3])
        let c5without = NSLayoutConstraint.constraintsWithVisualFormat("V:[v1]-(20)-[v3(20)]", options: [], metrics: nil, views: ["v1":v1, "v3":v3])
        
        self.constraintsWith.appendContentsOf(c1)
        self.constraintsWith.appendContentsOf(c2)
        self.constraintsWith.appendContentsOf(c3)
        self.constraintsWith.appendContentsOf(c4)
        self.constraintsWith.appendContentsOf(c5with)
        
        self.constraintsWithout.appendContentsOf(c1)
        self.constraintsWithout.appendContentsOf(c3)
        self.constraintsWithout.appendContentsOf(c4)
        self.constraintsWithout.appendContentsOf(c5without)
        
        NSLayoutConstraint.activateConstraints(self.constraintsWith)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swapContraint() {
        print("Swap Contraint")
        let mainView = self.view
        if self.v2.superview != nil {
            self.v2.removeFromSuperview()
            NSLayoutConstraint.deactivateConstraints(self.constraintsWith)
            NSLayoutConstraint.activateConstraints(self.constraintsWithout)
        } else {
            mainView.addSubview(v2)
            NSLayoutConstraint.deactivateConstraints(self.constraintsWithout)
            NSLayoutConstraint.activateConstraints(self.constraintsWith)
        }
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
