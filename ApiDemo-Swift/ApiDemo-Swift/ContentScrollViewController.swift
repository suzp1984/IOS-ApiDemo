//
//  ContentScrollViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/26/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ContentScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.cyanColor()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(sv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor))
        constraints.append(sv.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor))
        constraints.append(sv.topAnchor.constraintEqualToAnchor(self.view.topAnchor))
        constraints.append(sv.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor))
        
        let content = UIView()
        sv.addSubview(content)
        
        var y : CGFloat = 10
        
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.text = "This is Lable \(i + 1)"
            lab.sizeToFit()
            lab.frame.origin = CGPointMake(10, y)
            content.addSubview(lab)
            y += lab.bounds.size.height + 10
        }
        
        content.frame = CGRectMake(0, 0, 0, y)
        sv.contentSize = content.frame.size
        
        NSLayoutConstraint.activateConstraints(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
