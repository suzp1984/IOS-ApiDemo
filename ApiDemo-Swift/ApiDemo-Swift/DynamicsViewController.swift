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
        return .ellipse
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
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

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: UIControlState())
        button.addTarget(self, action: #selector(DynamicsViewController.start), for: .touchUpInside)
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        self.iv = MyIV(image: UIImage(named: "Mars"))
        self.iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.iv)
        self.iv.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        self.iv.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.iv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.iv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.anim = UIDynamicAnimator(referenceView: self.view)
        self.anim.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start(_ sender: UIButton) {
        sender.isEnabled = false
        
        let grav = MyGravityBehavior()
        
        /*
         The retain cycle issue here is more complicated than I thought.
         I demonstrate some alternatives...
         */
        
        switch which {
        case 1:
            // leak! neither the image view nor the gravity behavior is released
            grav.action = {
                let items = self.anim.items(in: self.view.bounds) as! [UIView]
                let ix = items.index(of: self.iv)
                if ix == nil {
                    self.anim.removeAllBehaviors()
                    self.iv.removeFromSuperview()
                    print("done")
                }
            }
        case 2:
            grav.action = {
                let items = self.anim.items(in: self.view.bounds) as! [UIView]
                let ix = items.index(of: self.iv)
                if ix == nil {
                    self.anim.removeAllBehaviors()
                    self.iv.removeFromSuperview()
                    self.anim = nil // * both are released
                    print("done")
                }
            }
        case 3:
            grav.action = {
                let items = self.anim.items(in: self.view.bounds) as! [UIView]
                let ix = items.index(of: self.iv)
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
                    let items = self.anim.items(in: self.view.bounds) as! [UIView]
                    let ix = items.index(of: self.iv)
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
        
        let push = UIPushBehavior(items:[self.iv], mode:.instantaneous)
        push.pushDirection = CGVector(dx: 1, dy: 0)
        //push.setTargetOffsetFromCenter(UIOffsetMake(0,-200), forItem: self.iv)
        self.anim.addBehavior(push)
        
        // ========
        
        let coll = UICollisionBehavior()
        coll.collisionMode = .boundaries
        coll.collisionDelegate = self
        coll.addBoundary(withIdentifier: "floor" as NSCopying,
                                       from:CGPoint(x: 0, y: self.view.bounds.maxY),
                                       to:CGPoint(x: self.view.bounds.maxX,
                                        y: self.view.bounds.maxY))
        self.anim.addBehavior(coll)
        coll.addItem(self.iv)
        
        // =========
        
        let bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.8
        self.anim.addBehavior(bounce)
        bounce.addItem(self.iv)
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

}

extension DynamicsViewController : UIDynamicAnimatorDelegate, UICollisionBehaviorDelegate {
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        print("pause")
    }
    
    func dynamicAnimatorWillResume(_ animator: UIDynamicAnimator) {
        print("resume")
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior,
                           beganContactFor item: UIDynamicItem,
                                               withBoundaryIdentifier identifier: NSCopying?,
                                                                      at p: CGPoint) {
        print(p)
        // look for the dynamic item behavior
        let b = self.anim.behaviors
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
    
}
