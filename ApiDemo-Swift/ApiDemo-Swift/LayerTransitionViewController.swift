//
//  LayerTransitionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/20/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class LayerTransitionViewController: UIViewController {

    var v : UIView!
    var layer : CALayer!
    var isMars : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.v = UIView()
        self.view.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 100).isActive = true
        v.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        v.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        v.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true
        
        let button = UIButton(type: .system)
        button.setTitle("Start", for: UIControlState())
        button.addTarget(self, action: #selector(LayerTransitionViewController.startTransition), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        
        self.layer = CALayer()
        self.v.layer.addSublayer(layer)
    }
    
    override func viewDidLayoutSubviews() {
        print("View Did LayoutSubViews")
        
        self.layer.frame = self.v.layer.bounds
        // Do not add sublayer in viewDidLayoutSubViews method
        // v.layer.addSublayer(layer)
        self.isMars = true
        layer.contents = UIImage(named: "Mars")?.cgImage
        layer.contentsGravity = kCAGravityResizeAspectFill
        v.layer.masksToBounds = false // try making this false to see what difference it makes
        v.layer.borderWidth = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func startTransition() {
        
        let t = CATransition()
        t.type = kCATransitionPush
        t.subtype = kCATransitionFromBottom
        t.duration = 2
        CATransaction.setDisableActions(true)
        if (self.isMars) {
            self.layer.contents = UIImage(named: "smiley")?.cgImage
        } else {
            self.layer.contents = UIImage(named: "Mars")?.cgImage
        }
        
        self.isMars = !self.isMars
        
        self.layer.add(t, forKey: nil)
    }
}
