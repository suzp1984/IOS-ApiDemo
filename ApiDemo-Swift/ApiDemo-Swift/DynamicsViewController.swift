//
//  DynamicsViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/22/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MyGravityBehavior : UIGravityBehavior {
    deinit {
        print("farewell from grav")
    }
}

class MyIV : UIImageView {
    // new in iOS 9, we can describe the shape of our image view for collisions
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
    
    override func willMoveToWindow(newWindow: UIWindow?) {
        print("image view move to \(newWindow)")
    }
    deinit {
        print("farewell from iv")
    }
}

class DynamicsViewController: UIViewController {

    var iv : MyIV!
    var anim : UIDynamicAnimator!
    let which = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: .System)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", forState: .Normal)
        button.addTarget(self, action: #selector(DynamicsViewController.start), forControlEvents: .TouchUpInside)
        button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20).active = true
        button.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20).active = true
        
        self.iv = MyIV(image: UIImage(named: "Mars"))
        self.iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.iv)
        self.iv.topAnchor.constraintEqualToAnchor(button.bottomAnchor, constant: 20).active = true
        self.iv.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.iv.widthAnchor.constraintEqualToConstant(100).active = true
        self.iv.heightAnchor.constraintEqualToConstant(100).active = true
        
        self.anim = UIDynamicAnimator(referenceView: self.view)
        self.anim.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start(sender: UIButton) {
        sender.enabled = false
        
        let grav = MyGravityBehavior()
        
        /*
         The retain cycle issue here is more complicated than I thought.
         I demonstrate some alternatives...
         */
        
        switch which {
        case 1:
            // leak! neither the image view nor the gravity behavior is released
            grav.action = {
                let items = self.anim.itemsInRect(self.view.bounds) as! [UIView]
                let ix = items.indexOf(self.iv)
                if ix == nil {
                    self.anim.removeAllBehaviors()
                    self.iv.removeFromSuperview()
                    print("done")
                }
            }
        case 2:
            grav.action = {
                let items = self.anim.itemsInRect(self.view.bounds) as! [UIView]
                let ix = items.indexOf(self.iv)
                if ix == nil {
                    self.anim.removeAllBehaviors()
                    self.iv.removeFromSuperview()
                    self.anim = nil // * both are released
                    print("done")
                }
            }
        case 3:
            grav.action = {
                let items = self.anim.itemsInRect(self.view.bounds) as! [UIView]
                let ix = items.indexOf(self.iv)
                if ix == nil {
                    self.delay(0) { // * both are released
                        self.anim.removeAllBehaviors()
                        self.iv.removeFromSuperview()
                        print("done")
                    }
                }
            }
        case 4:
            grav.action = {
                [weak grav] in // *
                if let grav = grav {
                    let items = self.anim.itemsInRect(self.view.bounds) as! [UIView]
                    let ix = items.indexOf(self.iv)
                    if ix == nil {
                        self.anim.removeBehavior(grav) // * grav is released, iv is not!
                        self.anim.removeAllBehaviors() // probably because of the other behaviors
                        self.iv.removeFromSuperview()
                        print("done")
                    }
                }
            }
        default: break
        }
        
        self.anim.addBehavior(grav)
        grav.addItem(self.iv)
        
        // ========
        
        let push = UIPushBehavior(items:[self.iv], mode:.Instantaneous)
        push.pushDirection = CGVectorMake(1, 0)
        //push.setTargetOffsetFromCenter(UIOffsetMake(0,-200), forItem: self.iv)
        self.anim.addBehavior(push)
        
        // ========
        
        let coll = UICollisionBehavior()
        coll.collisionMode = .Boundaries
        coll.collisionDelegate = self
        coll.addBoundaryWithIdentifier("floor",
                                       fromPoint:CGPointMake(0, self.view.bounds.maxY),
                                       toPoint:CGPointMake(self.view.bounds.maxX,
                                        self.view.bounds.maxY))
        self.anim.addBehavior(coll)
        coll.addItem(self.iv)
        
        // =========
        
        let bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.8
        self.anim.addBehavior(bounce)
        bounce.addItem(self.iv)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}

extension DynamicsViewController : UIDynamicAnimatorDelegate, UICollisionBehaviorDelegate {
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        print("pause")
    }
    
    func dynamicAnimatorWillResume(animator: UIDynamicAnimator) {
        print("resume")
    }
    
    func collisionBehavior(behavior: UICollisionBehavior,
                           beganContactForItem item: UIDynamicItem,
                                               withBoundaryIdentifier identifier: NSCopying?,
                                                                      atPoint p: CGPoint) {
        print(p)
        // look for the dynamic item behavior
        let b = self.anim.behaviors
        if let ix = b.indexOf({$0 is UIDynamicItemBehavior}) {
            let bounce = b[ix] as! UIDynamicItemBehavior
            let v = bounce.angularVelocityForItem(item)
            print(v)
            if v <= 6 {
                print("adding angular velocity")
                bounce.addAngularVelocity(6, forItem:item)
            }
        }
    }
    
}