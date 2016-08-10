//
//  RotationGestureRecognizerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/10/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class RotationGestureRecognizerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let v = UIView()
        v.frame = CGRectMake(0, 0, 150, 150)
        v.center = self.view.center
        v.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(v)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(RotationGestureRecognizerViewController.rotationHandler(_:)))
        v.addGestureRecognizer(rotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotationHandler(r: UIRotationGestureRecognizer) {
        if let v = r.view {
            v.transform = CGAffineTransformMakeRotation(r.rotation)
        }
    }

}
