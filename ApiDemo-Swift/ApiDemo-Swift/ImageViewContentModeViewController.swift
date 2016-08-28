//
//  ImageViewContentModeViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/12/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageViewContentModeViewController: UIViewController {

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mainView = self.view
        mainView.backgroundColor = UIColor.whiteColor()
        
        let iv = UIImageView(image: UIImage(named: "Mars"))
        mainView.addSubview(iv)
        iv.clipsToBounds = true
        iv.contentMode = .ScaleAspectFit
        
        iv.layer.borderColor = UIColor.blackColor().CGColor
        iv.layer.borderWidth = 2
        iv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
            iv.centerXAnchor.constraintEqualToAnchor(iv.superview!.centerXAnchor),
            iv.centerYAnchor.constraintEqualToAnchor(iv.superview!.centerYAnchor)
            ])
        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(>=10)-[iv]-(>=10)-[blg]|", options: [],
                metrics: nil, views: ["tlg":self.topLayoutGuide, "iv":iv, "blg":self.bottomLayoutGuide])
            ].flatMap{$0})
        
        delay (2) {

            iv.image = UIImage(named:"bottle5.png")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
