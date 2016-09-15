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
        let button = UIButton(type: UIButtonType.system) as UIButton
        // button.frame = CGRectMake(100, 100, 50, 50)
        button.backgroundColor =  UIColor.green
        button.setTitle("Swap", for: UIControlState())
        button.addTarget(self, action: #selector(ConstraintSwapViewController.swapContraint), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let d = ["b" : button]
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[b]", options: [], metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(80)-[b]", options: [], metrics: nil, views: d)
            ].joined().map{$0})
        
        // add custom UIView
        let v1 = UIView()
        v1.backgroundColor = UIColor.red
        v1.translatesAutoresizingMaskIntoConstraints = false
        let v2 = UIView()
        v2.backgroundColor = UIColor.yellow
        v2.translatesAutoresizingMaskIntoConstraints = false
        let v3 = UIView()
        v3.backgroundColor = UIColor.blue
        v3.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(v1)
        self.view.addSubview(v2)
        self.view.addSubview(v3)
        
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3
        
        let c1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v" : v1])
        let c2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v" : v2])
        let c3 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v(100)]", options: [], metrics: nil, views: ["v" : v3])
        let c4 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(200)-[v(20)]", options: [], metrics: nil, views: ["v" : v1])
        let c5with = NSLayoutConstraint.constraints(withVisualFormat: "V:[v1]-(20)-[v2(20)]-(20)-[v3(20)]", options: [], metrics: nil, views: ["v1":v1, "v2":v2, "v3":v3])
        let c5without = NSLayoutConstraint.constraints(withVisualFormat: "V:[v1]-(20)-[v3(20)]", options: [], metrics: nil, views: ["v1":v1, "v3":v3])
        
        self.constraintsWith.append(contentsOf: c1)
        self.constraintsWith.append(contentsOf: c2)
        self.constraintsWith.append(contentsOf: c3)
        self.constraintsWith.append(contentsOf: c4)
        self.constraintsWith.append(contentsOf: c5with)
        
        self.constraintsWithout.append(contentsOf: c1)
        self.constraintsWithout.append(contentsOf: c3)
        self.constraintsWithout.append(contentsOf: c4)
        self.constraintsWithout.append(contentsOf: c5without)
        
        NSLayoutConstraint.activate(self.constraintsWith)
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
            NSLayoutConstraint.deactivate(self.constraintsWith)
            NSLayoutConstraint.activate(self.constraintsWithout)
        } else {
            mainView?.addSubview(v2)
            NSLayoutConstraint.deactivate(self.constraintsWithout)
            NSLayoutConstraint.activate(self.constraintsWith)
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
