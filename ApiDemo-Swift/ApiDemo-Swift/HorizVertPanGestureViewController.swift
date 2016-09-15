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

        self.view.backgroundColor = UIColor.white
        let v = UIView(frame: CGRect(x: 120, y: 120, width: 150, height: 150))
        v.backgroundColor = UIColor.red
        
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

    func dragging(_ p: UIPanGestureRecognizer) {
        if let v = p.view {
            switch p.state {
            case .began, .changed:
                let delta = p.translation(in: v.superview)
                var c = v.center
                c.x += delta.x
                c.y += delta.y
                v.center = c
                p.setTranslation(CGPoint.zero, in: v.superview)
            case .failed:
                print("Dragging states is failed.")
            default:
                break
            }
        }
    }

}
