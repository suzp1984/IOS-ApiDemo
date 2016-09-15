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

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.setTitle("Start", for: UIControlState())
        button.addTarget(self, action: #selector(AnimationAutoLayoutViewController.start), for: .touchUpInside)
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v)
        v.backgroundColor = UIColor.black
        v.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        v.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        v.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20.0).isActive = true
        constraint = v.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0)
        constraint.isActive = true
        
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
                UIView.animate(withDuration: 1, animations:{
                    v.center.x += 100
                }) // everything *looks* okay, but it isn't
            case 2:
                UIView.animate(withDuration: 1, animations:{
                    v.center.x += 100
                    }, completion: {
                        _ in
                        // NB new in iOS 9 must call setNeedsLayout to get layout
                        v.superview!.setNeedsLayout()
                        v.superview!.layoutIfNeeded() // this is what will happen at layout time
                })
            case 3:
                self.constraint.constant += 100
                UIView.animate(withDuration: 1, animations:{
                    v.superview!.layoutIfNeeded()
                    }, completion: nil)
            case 4:
                // this works fine in iOS 8! does not trigger spurious layout
                UIView.animate(withDuration: 0.3, delay: 0, options: .autoreverse, animations: {
                    v.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                    }, completion: {
                        _ in
                        v.transform = CGAffineTransform.identity
                })
                
            case 5:
                // this works in iOS 7 as well; layer animation does not trigger spurious layout there
                let ba = CABasicAnimation(keyPath:"transform")
                ba.autoreverses = true
                ba.duration = 0.3
                ba.toValue = NSValue(caTransform3D:CATransform3DMakeScale(1.1, 1.1, 1))
                v.layer.add(ba, forKey:nil)
            case 6:
                let snap = v.snapshotView(afterScreenUpdates: false)
                snap?.frame = v.frame
                v.superview!.addSubview(snap!)
                v.isHidden = true
                UIView.animate(withDuration: 1, animations:{
                    snap?.center.x += 100
                })


            default:
                return
            }
            
        }
    }
    
}
