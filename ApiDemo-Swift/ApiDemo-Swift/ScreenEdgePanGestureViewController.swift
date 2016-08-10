//
//  ScreenEdgePanGestureViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/10/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ScreenEdgePanGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let v = UIView()
        v.frame = CGRectMake(0, 0, 150, 150)
        v.center = CGPoint(x: self.view.bounds.width - 75, y: self.view.center.y)
        v.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(v)
        
        let edge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(ScreenEdgePanGestureViewController.edgePanHandle(_:)))
        edge.edges = .Right
        
        v.addGestureRecognizer(edge)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func edgePanHandle(e : UIScreenEdgePanGestureRecognizer) {
        
        if let v = e.view {
            switch e.state {
            case .Began, .Changed:
                let delta = e.translationInView(v.superview)
                var c = v.center
                c.x += delta.x
                c.y += delta.y
                v.center = c
                e.setTranslation(CGPointZero, inView: v.superview)
            case .Failed:
                print("Dragging states is failed.")
            default:
                break
            }
        }
    }
}
