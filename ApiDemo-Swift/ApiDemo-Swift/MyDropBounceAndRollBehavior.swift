//
//  MyDropBounceAndRollBehavior.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/22/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MyDropBounceAndRollBehavior: UIDynamicBehavior, UICollisionBehaviorDelegate {
    let v : UIView
    
    init(view v:UIView) {
        self.v = v
        super.init()
    }
    
    
    override func willMove(to anim: UIDynamicAnimator?) {
        guard let anim = anim else { return }
        
        let sup = self.v.superview!
        
        let grav = UIGravityBehavior()
        grav.action = {
            // self will retain grav so do not let grav retain self
            // this is actually a simpler case for memory management,
            // because "self" incorporates all the behaviors at once
            [unowned self] in // * changed from weak to unowned here
            let items = anim.items(in: sup.bounds) as! [UIView]
            if items.index(of: self.v) == nil {
                anim.removeBehavior(self)
                self.v.removeFromSuperview()
                print("done")
            }
        }
        self.addChildBehavior(grav)
        grav.addItem(self.v)
        
        let push = UIPushBehavior(items:[self.v], mode:.instantaneous)
        push.pushDirection = CGVector(dx: 1, dy: 0)
        //push.setTargetOffsetFromCenter(UIOffsetMake(0,-200), forItem: self.iv)
        self.addChildBehavior(push)
        
        let coll = UICollisionBehavior()
        coll.collisionMode = .boundaries
        coll.collisionDelegate = self
        coll.addBoundary(withIdentifier: "floor" as NSCopying,
                                       from:CGPoint(x: 0, y: sup.bounds.maxY),
                                       to:CGPoint(x: sup.bounds.maxX, y: sup.bounds.maxY))
        self.addChildBehavior(coll)
        coll.addItem(self.v)
        
        let bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.8
        self.addChildBehavior(bounce)
        bounce.addItem(self.v)
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior,
                           beganContactFor item: UIDynamicItem,
                                               withBoundaryIdentifier identifier: NSCopying?,
                                                                      at p: CGPoint) {
        print(p)
        // look for the dynamic item behavior
        let b = self.childBehaviors
        if let ix = b.index(where: {$0 is UIDynamicItemBehavior}) {
            let bounce = b[ix] as! UIDynamicItemBehavior
            let v = bounce.angularVelocity(for: item)
            print(v)
            if v <= 6 {
                print("adding angular velocity")
                bounce.addAngularVelocity(6, for:item)
            }
        }
    }
    
    deinit {
        print("farewell from behavior") // prove we are being deallocated in good order
    }

}
