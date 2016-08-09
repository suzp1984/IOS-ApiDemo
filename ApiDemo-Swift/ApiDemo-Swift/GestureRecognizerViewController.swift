//
//  GestureRecognizerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/9/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class GestureRecognizerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let v = UIView()
        v.backgroundColor = UIColor.redColor()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(v)
        NSLayoutConstraint.activateConstraints([
                v.widthAnchor.constraintEqualToConstant(150),
                v.heightAnchor.constraintEqualToConstant(150),
                v.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 40),
                v.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        
        let t2 = UITapGestureRecognizer(target: self, action: #selector(GestureRecognizerViewController.doubleTap))
        t2.numberOfTapsRequired = 2
        v.addGestureRecognizer(t2)
        
        let t1 = UITapGestureRecognizer(target: self, action: #selector(GestureRecognizerViewController.singleTap))
        t1.requireGestureRecognizerToFail(t2)
        v.addGestureRecognizer(t1)
        
        let p = UIPanGestureRecognizer(target: self, action: #selector(GestureRecognizerViewController.dragging(_:)))
        v.addGestureRecognizer(p)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func singleTap() {
        print("single tap")
    }
    
    func doubleTap() {
        print("double tap")
    }
    
    func dragging(p: UIPanGestureRecognizer) {
        if let v = p.view {
            switch p.state {
            case .Began, .Changed:
                let delta = p.translationInView(v.superview)
                var c = v.center
                c.x += delta.x
                c.y += delta.y
                v.center = c
                p.setTranslation(CGPointZero, inView: v.superview)
            case .Failed:
                print("Dragging states is failed.")
            default:
                break
            }
        }
    }
}
