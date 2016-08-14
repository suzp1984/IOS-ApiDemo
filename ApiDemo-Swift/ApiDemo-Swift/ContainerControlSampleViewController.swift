//
//  ContainerControlSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/14/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ContainerControlSampleViewController: UIViewController {

    var cur : Int = 0
    var swappers : [UIViewController]?
    var panel : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        let panel = UIView()
        panel.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(panel)
        panel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                panel.widthAnchor.constraintEqualToConstant(150),
                panel.heightAnchor.constraintEqualToConstant(150),
                panel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                panel.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
            ])
        self.panel = panel
        
        let flipBtn = UIButton(type: .System)
        flipBtn.setTitle("Flip", forState: .Normal)
        flipBtn.addTarget(self, action: #selector(ContainerControlSampleViewController.flip(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(flipBtn)
        flipBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                flipBtn.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                flipBtn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // setup swapper child controller
        self.swappers = [SecondPresentViewController(), ThirdPresentViewController()]
        
        let vc = self.swappers![cur]
        self.addChildViewController(vc)
        vc.view.frame = panel.bounds
        panel.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func flip(sender: UIButton) {
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        let fromVc = self.swappers![cur]
        cur = cur == 0 ? 1 : 0
        let toVc = self.swappers![cur]
        toVc.view.frame = self.panel!.bounds
        
        self.addChildViewController(toVc)
        fromVc.willMoveToParentViewController(nil)
        self.transitionFromViewController(fromVc, toViewController: toVc, duration: 0.4, options: .TransitionFlipFromLeft, animations: nil, completion: {
            _ in
            toVc.didMoveToParentViewController(self)
            fromVc.removeFromParentViewController()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        })
    }
}
