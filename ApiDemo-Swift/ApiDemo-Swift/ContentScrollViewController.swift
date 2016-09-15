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
        sv.backgroundColor = UIColor.cyan
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(sv.leftAnchor.constraint(equalTo: self.view.leftAnchor))
        constraints.append(sv.rightAnchor.constraint(equalTo: self.view.rightAnchor))
        constraints.append(sv.topAnchor.constraint(equalTo: self.view.topAnchor))
        constraints.append(sv.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor))
        
        let content = UIView()
        sv.addSubview(content)
        
        var y : CGFloat = 10
        
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.text = "This is Lable \(i + 1)"
            lab.sizeToFit()
            lab.frame.origin = CGPoint(x: 10, y: y)
            content.addSubview(lab)
            y += lab.bounds.size.height + 10
        }
        
        content.frame = CGRect(x: 0, y: 0, width: 0, height: y)
        sv.contentSize = content.frame.size
        
        NSLayoutConstraint.activate(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
