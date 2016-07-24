//
//  StatusBarStyleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/24/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class StatusBarStyleViewController: UIViewController {

    var hide : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blueColor()
        
        let button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hide StatusBar", forState: .Normal)
        button.setTitleColor(UIColor.yellowColor(), forState: .Normal)
        button.addTarget(self, action: #selector(StatusBarStyleViewController.toggleStatusBar(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
        button.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        button.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return self.hide
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return .Fade
    }
    
    func toggleStatusBar(sender: UIButton) -> Void {
        self.hide = !self.hide
        if self.hide {
            sender.setTitle("Show StatusBar", forState: .Normal)
        } else {
            sender.setTitle("Hide StatusBar", forState: .Normal)
        }
        
        UIView.animateWithDuration(0.5, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
            self.view.layoutIfNeeded()
        })
    }
}
