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

        self.view.backgroundColor = UIColor.white
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        v.center = CGPoint(x: self.view.bounds.width - 75, y: self.view.center.y)
        v.backgroundColor = UIColor.red
        
        self.view.addSubview(v)
        
        let edge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(ScreenEdgePanGestureViewController.edgePanHandle(_:)))
        edge.edges = .right
        
        v.addGestureRecognizer(edge)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func edgePanHandle(_ e : UIScreenEdgePanGestureRecognizer) {
        
        if let v = e.view {
            switch e.state {
            case .began, .changed:
                let delta = e.translation(in: v.superview)
                var c = v.center
                c.x += delta.x
                c.y += delta.y
                v.center = c
                e.setTranslation(CGPoint.zero, in: v.superview)
            case .failed:
                print("Dragging states is failed.")
            default:
                break
            }
        }
    }
}
