//
//  OriginChangedViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/15/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class OriginChangedViewController: UIViewController {

    var v1 : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let v1 = UIView(frame: CGRectMake(113, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        self.v1 = v1
        
        let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        
        self.view.addSubview(v1)
        v1.addSubview(v2)
        
        let btn = UIButton(type: .System)
        btn.setTitle("chang origin", forState: .Normal)
        btn.addTarget(self, action: #selector(OriginChangedViewController.changeOrigin(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                btn.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                btn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeOrigin(sender: UIButton) {
        if let v1 = self.v1 {
            v1.bounds.origin.x += 10
            v1.bounds.origin.y += 10
        }
    }

}
