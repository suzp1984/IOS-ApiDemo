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

        self.view.backgroundColor = UIColor.white
        
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        v.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        
        v.backgroundColor = UIColor.red
        
        self.view.addSubview(v)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(PinchGestureRecognizerViewController.pinchHandler(_:)))
        v.addGestureRecognizer(pinch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pinchHandler(_ p: UIPinchGestureRecognizer) {
        // print(p.scale, p.velocity)
        if let v = p.view {
            v.transform = CGAffineTransform(scaleX: p.scale, y: p.scale)
        }
    }

}
