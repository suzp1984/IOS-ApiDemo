//
//  ImageViewContentModeViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/12/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageViewContentModeViewController: UIViewController {

    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mainView = self.view
        mainView?.backgroundColor = UIColor.white
        
        let iv = UIImageView(image: UIImage(named: "Mars"))
        mainView?.addSubview(iv)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        
        iv.layer.borderColor = UIColor.black.cgColor
        iv.layer.borderWidth = 2
        iv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iv.centerXAnchor.constraint(equalTo: iv.superview!.centerXAnchor),
            iv.centerYAnchor.constraint(equalTo: iv.superview!.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-(>=10)-[iv]-(>=10)-[blg]|", options: [],
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
