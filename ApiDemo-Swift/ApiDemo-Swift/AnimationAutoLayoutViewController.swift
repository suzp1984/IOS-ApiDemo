//
//  AnimationAutoLayoutViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/23/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class AnimationAutoLayoutViewController: UIViewController {

    var v : UIView?
    let which = 5
    var constraint : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.setTitle("Start", forState: .Normal)
        button.addTarget(self, action: #selector(AnimationAutoLayoutViewController.start), forControlEvents: .TouchUpInside)
        button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20).active = true
        button.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20).active = true
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v)
        v.backgroundColor = UIColor.blackColor()
        v.widthAnchor.constraintEqualToConstant(100.0).active = true
        v.heightAnchor.constraintEqualToConstant(100.0).active = true
        v.topAnchor.constraintEqualToAnchor(button.bottomAnchor, constant: 20.0).active = true
        constraint = v.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20.0)
        constraint.active = true
        
        self.v = v
        // v.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 30)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start() {
        if let v = self.v {
            switch which {
            case 1:
                UIView.animateWithDuration(1, animations:{
                    v.center.x += 100
                }) // everything *looks* okay, but it isn't
            case 2:
                UIView.animateWithDuration(1, animations:{
                    v.center.x += 100
                    }, completion: {
                        _ in
                        // NB new in iOS 9 must call setNeedsLayout to get layout
                        v.superview!.setNeedsLayout()
                        v.superview!.layoutIfNeeded() // this is what will happen at layout time
                })
            case 3:
                self.constraint.constant += 100
                UIView.animateWithDuration(1, animations:{
                    v.superview!.layoutIfNeeded()
                    }, completion: nil)
            case 4:
                // this works fine in iOS 8! does not trigger spurious layout
                UIView.animateWithDuration(0.3, delay: 0, options: .Autoreverse, animations: {
                    v.transform = CGAffineTransformMakeScale(1.1, 1.1)
                    }, completion: {
                        _ in
                        v.transform = CGAffineTransformIdentity
                })
                
            case 5:
                // this works in iOS 7 as well; layer animation does not trigger spurious layout there
                let ba = CABasicAnimation(keyPath:"transform")
                ba.autoreverses = true
                ba.duration = 0.3
                ba.toValue = NSValue(CATransform3D:CATransform3DMakeScale(1.1, 1.1, 1))
                v.layer.addAnimation(ba, forKey:nil)
            case 6:
                let snap = v.snapshotViewAfterScreenUpdates(false)
                snap.frame = v.frame
                v.superview!.addSubview(snap)
                v.hidden = true
                UIView.animateWithDuration(1, animations:{
                    snap.center.x += 100
                })


            default:
                return
            }
            
        }
    }
    
}
