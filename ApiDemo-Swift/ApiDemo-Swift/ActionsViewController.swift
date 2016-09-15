//
//  ActionsViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/21/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MyAction : NSObject, CAAction {
    func run(forKey event: String, object anObject: Any,
                         arguments dict: [AnyHashable: Any]?) {
        let anim = CABasicAnimation(keyPath: event)
        anim.duration = 5
        let lay = anObject as! CALayer
        let newP = lay.value(forKey: event)
        let oldP = (lay.presentation()!).value(forKey: event)
        print("from \(oldP) to \(newP)")
        lay.add(anim, forKey:nil)
    }
}

class MyWagglePositionAction : NSObject, CAAction {
    func run(forKey event: String, object anObject: Any,
                         arguments dict: [AnyHashable: Any]?) {
        let lay = anObject as! CALayer
        let newP = (lay.value(forKey: event) as! NSValue).cgPointValue
        let oldP = ((lay.presentation()!).value(forKey: event) as! NSValue).cgPointValue
        
        let d = sqrt(pow(oldP.x - newP.x, 2) + pow(oldP.y - newP.y, 2))
        let r = Double(d/3.0)
        let theta = Double(atan2(newP.y - oldP.y, newP.x - oldP.x))
        let wag = 10*M_PI/180.0
        let p1 = CGPoint(
            x: oldP.x + CGFloat(r*cos(theta+wag)),
            y: oldP.y + CGFloat(r*sin(theta+wag)))
        let p2 = CGPoint(
            x: oldP.x + CGFloat(r*2*cos(theta-wag)),
            y: oldP.y + CGFloat(r*2*sin(theta-wag)))
        let anim = CAKeyframeAnimation(keyPath: event)
        anim.values = [oldP,p1,p2,newP].map{NSValue(cgPoint:$0)}
        anim.calculationMode = kCAAnimationCubic
        
        lay.add(anim, forKey:nil)
    }
}

class ActionsViewController: UIViewController {

    var layer : CALayer!
    let which = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        button.setTitle("Start", for: UIControlState())
        button.addTarget(self, action: #selector(ActionsViewController.doAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        let layer = MyLayer()
        layer.frame = CGRect(x: 150,y: 250,width: 40,height: 40)
        CATransaction.setDisableActions(true) // prevent MyLayer automatic contents animation on next line
        layer.contents = UIImage(named:"Mars")!.cgImage
        layer.contentsGravity = kCAGravityResizeAspectFill
        self.view.layer.addSublayer(layer)
        self.layer = layer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doAction() -> Void {
        let layer = self.layer
        
        switch which {
        case 1:
            layer?.position = CGPoint(x: 100,y: 100) // proving that it normally works
            
        case 2:
            // turn off position animation for this layer
            layer?.setValue(true, forKey:"suppressPositionAnimation")
            layer?.position = CGPoint(x: 100,y: 100) // look Ma, no animation!
            
        case 3:
            // put a "position" entry into the layer's actions dictionary
            let ba = CABasicAnimation()
            ba.duration = 5
            layer?.actions = ["position": ba]
            layer?.delegate = nil // use actions dictionary, not delegate
            
            // use implicit property animation
            let newP = CGPoint(x: 100,y: 100)
            CATransaction.setAnimationDuration(1.5)
            layer?.position = newP
            // the animation "ba" will be used, with its 5-second duration
            
        case 4:
            // put a much more powerful "position" entry into the layer's actions dictionary
            layer?.actions = ["position": MyAction()]
            layer?.delegate = nil
            
            // use implicit property animation
            let newP = CGPoint(x: 100,y: 100)
            CATransaction.setAnimationDuration(1.5)
            layer?.position = newP
            // the animation still has a 5-second duration
            
        case 5:
            
            layer?.delegate = nil
            layer?.actions = ["position": MyWagglePositionAction()]
            
            CATransaction.setAnimationDuration(0.4)
            layer?.position = CGPoint(x: 200,y: 200) // waggle
            
        case 6:
            // same as preceding but we use the delegate
            layer?.delegate = self
            CATransaction.setAnimationDuration(0.4)
            layer?.position = CGPoint(x: 200,y: 200) // waggle
            
            
        case 7:
            // layer automatically turns this into a push-from-left transition
            layer?.contents = UIImage(named:"smiley")!.cgImage
            
        case 8:
            let layer = CALayer()
            layer.frame = CGRect(x: 200,y: 50,width: 40,height: 40)
            layer.contentsGravity = kCAGravityResizeAspectFill
            layer.contents = UIImage(named:"smiley")!.cgImage
            layer.delegate = self
            self.view.layer.addSublayer(layer)
            // the delegate (me) will "pop" the layer as it appears
            
        case 9:
            layer?.delegate = self
            
            CATransaction.setCompletionBlock({
                layer?.removeFromSuperlayer()
            })
            CATransaction.setValue("", forKey:"bye")
            layer?.opacity = 0
            // the delegate (me) will "shrink" the layer as it disappears
            
        case 10:
            // intended to supersede the preceding; I think this is a much neater way
            // layer?.delegate = self
            layer?.setValue("", forKey:"farewell")
            // the delegate will "shrink" the layer and remove it
            
            
        default: break
        }
    }
    
    
    override func actionForLayer(_ layer: CALayer, forKey key: String) -> CAAction? {
        if key == "position" {
            return MyWagglePositionAction()
        }
        
        // on layer addition (addSublayer this layer), "pop" into view
        if key == kCAOnOrderIn {
            let anim1 = CABasicAnimation(keyPath:"opacity")
            anim1.fromValue = 0.0
            anim1.toValue = layer.opacity
            let anim2 = CABasicAnimation(keyPath:"transform")
            anim2.toValue = NSValue(caTransform3D:
                CATransform3DScale(layer.transform, 1.2, 1.2, 1.0))
            anim2.autoreverses = true
            anim2.duration = 0.1
            let group = CAAnimationGroup()
            group.animations = [anim1, anim2]
            group.duration = 0.2
            return group
        }
        
        // on opacity change with "bye" key, "pop" out of sight
        if key == "opacity" {
            if CATransaction.value(forKey: "bye") != nil {
                let anim1 = CABasicAnimation(keyPath:"opacity")
                anim1.fromValue = layer.opacity
                anim1.toValue = 0.0
                let anim2 = CABasicAnimation(keyPath:"transform")
                anim2.toValue = NSValue(caTransform3D:
                    CATransform3DScale(layer.transform, 0.1, 0.1, 1.0))
                let group = CAAnimationGroup()
                group.animations = [anim1, anim2]
                group.duration = 0.2
                return group
            }
        }
        
        // on "farewell" key setting, "pop" out of sight and remove from superlayer
        // supersedes previous
        if key == "farewell" {
            let anim1 = CABasicAnimation(keyPath:"opacity")
            anim1.fromValue = layer.opacity
            anim1.toValue = 0.0
            let anim2 = CABasicAnimation(keyPath:"transform")
            anim2.toValue = NSValue(caTransform3D:
                CATransform3DScale(layer.transform, 0.1, 0.1, 1.0))
            let group = CAAnimationGroup()
            group.animations = [anim1, anim2]
            group.duration = 0.2
            group.delegate = self // this will cause animationDidStop to be called
            group.setValue(layer, forKey:"remove") // both identifier and removal target
            layer.opacity = 0
            return group
        }
        
        return nil
    }
    
    override func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let layer = anim.value(forKey: "remove") as? CALayer {
            layer.removeFromSuperlayer()
        }
    }

}

class MyLayer : CALayer {
    
    // layer whose response to contents setting is automatic push from left
    
    override class func defaultAction(forKey key: String) -> CAAction? {
        if key == "contents" {
            let tr = CATransition()
            tr.type = kCATransitionPush
            tr.subtype = kCATransitionFromLeft
            return tr
        }
        return super.defaultAction(forKey: key)
    }
    
    // layer whose implicit position animation can be turned off
    
    override func action(forKey key: String) -> CAAction? {
        if key == "position" {
            if self.value(forKey: "suppressPositionAnimation") != nil {
                return nil
            }
        }
        return super.action(forKey: key)
    }
    
    
    override func removeFromSuperlayer() {
        print("I'm being removed from my superlayer")
        super.removeFromSuperlayer()
    }
    
}
