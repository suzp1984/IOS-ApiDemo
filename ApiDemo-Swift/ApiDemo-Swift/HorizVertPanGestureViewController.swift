//
//  HorizVertPanGestureViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/9/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class HorizVertPanGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        let v = UIView(frame: CGRectMake(120, 120, 150, 150))
        v.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(v)
        
        let horizGesture = HorizPanGestureRecognizer(target: self, action: #selector(HorizVertPanGestureViewController.dragging(_:)))
        v.addGestureRecognizer(horizGesture)
        
        let vertGesture = VertPanGestureRecognizer(target: self, action: #selector(HorizVertPanGestureViewController.dragging(_:)))
        v.addGestureRecognizer(vertGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
