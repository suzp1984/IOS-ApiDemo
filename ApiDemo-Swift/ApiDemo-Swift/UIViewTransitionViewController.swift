//
//  UIViewTransitionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/2/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class UIViewTransitionViewController: UIViewController {

    var iv : UIImageView!
    var rv : MyReverseView!
    var outer : UIView!
    var inner : UIView!
    var reverse : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        iv = UIImageView(image: UIImage(named: "Mars"))
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        iv.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor).active = true
        iv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 50).active = true
        iv.widthAnchor.constraintEqualToConstant(150).active = true
        iv.heightAnchor.constraintEqualToConstant(150).active = true
        
        let button = UIButton(type: .System)
        button.setTitle("Transite", forState: UIControlState.Normal)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20).active = true
        button.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20).active = true
        button.addTarget(self, action: #selector(UIViewTransitionViewController.animate), forControlEvents: .TouchUpInside)
        
        rv = MyReverseView()
        self.view.addSubview(rv)
        rv.backgroundColor = UIColor.purpleColor()
        rv.translatesAutoresizingMaskIntoConstraints = false
        rv.widthAnchor.constraintEqualToConstant(100).active = true
        rv.heightAnchor.constraintEqualToConstant(100).active = true
        rv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20).active = true
        rv.topAnchor.constraintEqualToAnchor(self.iv.bottomAnchor, constant: 20).active = true
        
        outer = UIView()
        outer.backgroundColor = UIColor.blueColor()
        self.view.addSubview(outer)
        outer.translatesAutoresizingMaskIntoConstraints = false
        outer.widthAnchor.constraintEqualToConstant(150).active = true
        outer.heightAnchor.constraintEqualToConstant(100).active = true
        outer.topAnchor.constraintEqualToAnchor(self.rv.bottomAnchor, constant: 20).active = true
        outer.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20).active = true
        
        inner = UIView()
        inner.backgroundColor = UIColor.redColor()
        self.outer.addSubview(inner)
        inner.translatesAutoresizingMaskIntoConstraints = false
        inner.widthAnchor.constraintEqualToConstant(40).active = true
        inner.heightAnchor.constraintEqualToConstant(80).active = true
        inner.leftAnchor.constraintEqualToAnchor(self.outer.leftAnchor).active = true
        inner.topAnchor.constraintEqualToAnchor(self.outer.topAnchor, constant: 10).active = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animate() -> Void {
        let opts : UIViewAnimationOptions = .TransitionFlipFromLeft
        UIView.transitionWithView(self.iv, duration: 2.0, options: opts, animations: {
                if (self.reverse) {
                    self.iv.image = UIImage(named: "Mars")
                } else {
                    self.iv.image = UIImage(named: "Moi")
                }
            
                self.reverse = !self.reverse
            }, completion: nil)
        
        UIView.transitionWithView(self.rv, duration: 2.0, options: opts, animations: {
                self.rv.setNeedsDisplay()
            }, completion: nil)
        
        let opts2 : UIViewAnimationOptions = [.AllowAnimatedContent]
        UIView.transitionWithView(self.outer, duration: 2.0, options: opts2, animations: {
                var f = self.inner.frame
                if (f.size.width == self.outer.frame.width) {
                    f.size.width = 40
                } else {
                    f.size.width = self.outer.frame.width
                }
                f.origin.x = 0
                self.inner.frame = f
            }, completion: nil)
    }
}
