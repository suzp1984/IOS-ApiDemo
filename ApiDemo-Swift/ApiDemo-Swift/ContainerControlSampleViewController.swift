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

        self.view.backgroundColor = UIColor.white
        let panel = UIView()
        panel.backgroundColor = UIColor.black
        
        self.view.addSubview(panel)
        panel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                panel.widthAnchor.constraint(equalToConstant: 150),
                panel.heightAnchor.constraint(equalToConstant: 150),
                panel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                panel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        self.panel = panel
        
        let flipBtn = UIButton(type: .system)
        flipBtn.setTitle("Flip", for: UIControlState())
        flipBtn.addTarget(self, action: #selector(ContainerControlSampleViewController.flip(_:)), for: .touchUpInside)
        self.view.addSubview(flipBtn)
        flipBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                flipBtn.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                flipBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // setup swapper child controller
        self.swappers = [SecondPresentViewController(), ThirdPresentViewController()]
        
        let vc = self.swappers![cur]
        self.addChildViewController(vc)
        vc.view.frame = panel.bounds
        panel.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func flip(_ sender: UIButton) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        let fromVc = self.swappers![cur]
        cur = cur == 0 ? 1 : 0
        let toVc = self.swappers![cur]
        toVc.view.frame = self.panel!.bounds
        
        self.addChildViewController(toVc)
        fromVc.willMove(toParentViewController: nil)
        self.transition(from: fromVc, to: toVc, duration: 0.4, options: .transitionFlipFromLeft, animations: nil, completion: {
            _ in
            toVc.didMove(toParentViewController: self)
            fromVc.removeFromParentViewController()
            UIApplication.shared.endIgnoringInteractionEvents()
        })
    }
}
