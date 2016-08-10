//
//  PinchGestureRecognizerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/10/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PinchGestureRecognizerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let v = UIView(frame: CGRectMake(0, 0, 150, 150))
        v.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
        
        v.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(v)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(PinchGestureRecognizerViewController.pinchHandler(_:)))
        v.addGestureRecognizer(pinch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pinchHandler(p: UIPinchGestureRecognizer) {
        // print(p.scale, p.velocity)
        if let v = p.view {
            v.transform = CGAffineTransformMakeScale(p.scale, p.scale)
        }
    }

}
