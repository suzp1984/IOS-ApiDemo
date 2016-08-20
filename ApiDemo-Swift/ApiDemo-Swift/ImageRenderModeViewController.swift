//
//  ImageRenderModeViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/20/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageRenderModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        let iv = UIImageView()
        if let image = UIImage(named: "SmileyTemplate") {
            image.imageWithRenderingMode(.Automatic)
            iv.tintColor = UIColor.redColor()
            iv.image = image
        }
        
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                iv.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                iv.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor),
                iv.widthAnchor.constraintEqualToConstant(50),
                iv.heightAnchor.constraintEqualToConstant(50)
            ])
        
        let ib = UIButton()
        ib.tintColor = UIColor.redColor()
        if let image = UIImage(named: "SmileyVector") {
            image.imageWithRenderingMode(.AlwaysTemplate)
            ib.setBackgroundImage(image, forState: .Normal)
        }
        
        self.view.addSubview(ib)
        ib.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                ib.topAnchor.constraintEqualToAnchor(iv.bottomAnchor, constant: 10),
                ib.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
