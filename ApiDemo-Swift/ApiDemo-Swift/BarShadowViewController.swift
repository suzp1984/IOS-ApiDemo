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

        self.view.backgroundColor = UIColor.white
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
        
        NSLayoutConstraint.activate([
                navBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                navBar.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
                toolBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                toolBar.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.bottomAnchor)
            ])
        
        let sz = CGSize(width: 20,height: 20)
        
        navBar.setBackgroundImage(imageOfSize(sz, false) {
            UIColor(white:0.95, alpha:0.85).setFill()
            //UIColor(red: 1, green: 0, blue: 0, alpha: 1).setFill()
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,y: 0,width: 20,height: 20))
            }, for:.any, barMetrics: .default)

        toolBar.setBackgroundImage(imageOfSize(sz) {
            UIColor(white:0.95, alpha:0.85).setFill()
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,y: 0,width: 20,height: 20))
            }, forToolbarPosition:.any, barMetrics: .default)
        
        let shadowsz = CGSize(width: 4,height: 4)
        
        navBar.shadowImage = imageOfSize(shadowsz) {
            UIColor.gray.withAlphaComponent(0.3).setFill()
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,y: 0,width: 4,height: 2))
            UIColor.gray.withAlphaComponent(0.15).setFill()
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,y: 2,width: 4,height: 2))
        }
        
        toolBar.setShadowImage(imageOfSize(shadowsz) {
            UIColor.gray.withAlphaComponent(0.3).setFill()
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,y: 2,width: 4,height: 2))
            UIColor.gray.withAlphaComponent(0.15).setFill()
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,y: 0,width: 4,height: 2))
            }, forToolbarPosition:.any )
        
        navBar.isTranslucent = true
        toolBar.isTranslucent = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func imageOfSize(_ size:CGSize, _ opaque:Bool = false, _ closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, opaque, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }

    func position(for bar: UIBarPositioning) -> UIBarPosition {
        switch true { // another (old) trick for special switch situations
            case bar === self.navBar: return .topAttached
            case bar === self.toolBar: return .bottom
            default: return .any
        }

    }
}
