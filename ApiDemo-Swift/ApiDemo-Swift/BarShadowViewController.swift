//
//  BarShadowViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class BarShadowViewController: UIViewController, UIBarPositioningDelegate {

    var navBar : UINavigationBar!
    var toolBar : UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        let navBar = UINavigationBar()
        //navBar.backgroundColor = UIColor.yellowColor()
        self.navBar = navBar
        
        let toolBar = UIToolbar()
        //toolBar.backgroundColor = UIColor.blueColor()
        self.toolBar = toolBar
        
        self.view.addSubview(navBar)
        self.view.addSubview(toolBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                navBar.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor),
                navBar.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor),
                toolBar.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor),
                toolBar.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.bottomAnchor)
            ])
        
        let sz = CGSizeMake(20,20)
        
        navBar.setBackgroundImage(imageOfSize(sz, false) {
            UIColor(white:0.95, alpha:0.85).setFill()
            //UIColor(red: 1, green: 0, blue: 0, alpha: 1).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0,0,20,20))
            }, forBarPosition:.Any, barMetrics: .Default)

        toolBar.setBackgroundImage(imageOfSize(sz) {
            UIColor(white:0.95, alpha:0.85).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0,0,20,20))
            }, forToolbarPosition:.Any, barMetrics: .Default)
        
        let shadowsz = CGSizeMake(4,4)
        
        navBar.shadowImage = imageOfSize(shadowsz) {
            UIColor.grayColor().colorWithAlphaComponent(0.3).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0,0,4,2))
            UIColor.grayColor().colorWithAlphaComponent(0.15).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0,2,4,2))
        }
        
        toolBar.setShadowImage(imageOfSize(shadowsz) {
            UIColor.grayColor().colorWithAlphaComponent(0.3).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0,2,4,2))
            UIColor.grayColor().colorWithAlphaComponent(0.15).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0,0,4,2))
            }, forToolbarPosition:.Any )
        
        navBar.translucent = true
        toolBar.translucent = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func imageOfSize(size:CGSize, _ opaque:Bool = false, _ closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, opaque, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }

    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        switch true { // another (old) trick for special switch situations
            case bar === self.navBar: return .TopAttached
            case bar === self.toolBar: return .Bottom
            default: return .Any
        }

    }
}
