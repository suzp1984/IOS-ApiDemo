//
//  AutoLayoutScrollViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/26/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class AutoLayoutScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.green
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        var constraints = [NSLayoutConstraint]()
        constraints.append(sv.leftAnchor.constraint(equalTo: self.view.leftAnchor))
        constraints.append(sv.rightAnchor.constraint(equalTo: self.view.rightAnchor))
        constraints.append(sv.topAnchor.constraint(equalTo: self.view.topAnchor))
        constraints.append(sv.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor))
        
        var previousLab : UILabel? = nil
        
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "This is Label \(i+1)"
            sv.addSubview(lab)
            constraints.append(lab.leftAnchor.constraint(equalTo: sv.leftAnchor, constant: 10))
            if let previousLab = previousLab {
                constraints.append(lab.topAnchor.constraint(equalTo: previousLab.bottomAnchor, constant: 10))
            } else {
                constraints.append(lab.topAnchor.constraint(equalTo: sv.topAnchor, constant: 10))
            }
            
            previousLab = lab
        }
        
        if let previousLab = previousLab {
        constraints.append(previousLab.bottomAnchor.constraint(equalTo: sv.bottomAnchor, constant: -10))
        }
        
        NSLayoutConstraint.activate(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
