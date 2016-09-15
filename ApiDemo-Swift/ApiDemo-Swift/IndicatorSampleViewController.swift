//
//  IndicatorSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/29/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class IndicatorSampleViewController: UIViewController {

    var isIndicator : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        button.setTitle("Toggle Indicator", for: UIControlState())
        button.addTarget(self, action: #selector(IndicatorSampleViewController.toggleIndicator(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 30),
                button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // custome indicator
        let lay = CAReplicatorLayer()
        lay.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        let bar = CALayer()
        bar.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        bar.backgroundColor = UIColor.red.cgColor
        lay.addSublayer(bar)
        lay.instanceCount = 5
        lay.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.fromValue = 1.0
        anim.toValue = 0.2
        anim.duration = 1.0
        anim.repeatCount = Float.infinity
        bar.add(anim, forKey: nil)
        lay.instanceDelay = anim.duration / Double(lay.instanceCount)
        self.view.layer.addSublayer(lay)
        lay.position = CGPoint(x: self.view.layer.bounds.midX, y: self.view.layer.bounds.midY)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleIndicator(_ sender: UIButton) {
        if isIndicator {
            if let v = self.view.viewWithTag(1001) {
                v.removeFromSuperview()
            }
        } else {
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            indicator.color = UIColor.yellow
            indicator.backgroundColor = UIColor(white: 0.2, alpha: 0.6)
            indicator.layer.cornerRadius = 5
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.tag = 1001
            indicator.hidesWhenStopped = true
            self.view.addSubview(indicator)
            
            NSLayoutConstraint.activate([
                    indicator.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 30),
                    indicator.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
//                    indicator.widthAnchor.constraintEqualToConstant(50),
//                    indicator.heightAnchor.constraintEqualToConstant(50)
                ])
            indicator.startAnimating()
        }
        
        isIndicator = !isIndicator
    }

}
