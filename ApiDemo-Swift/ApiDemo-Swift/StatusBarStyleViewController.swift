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

        self.view.backgroundColor = UIColor.blue
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hide StatusBar", for: UIControlState())
        button.setTitleColor(UIColor.yellow, for: UIControlState())
        button.addTarget(self, action: #selector(StatusBarStyleViewController.toggleStatusBar(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden : Bool {
        return self.hide
    }
    
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        return .fade
    }
    
    func toggleStatusBar(_ sender: UIButton) -> Void {
        self.hide = !self.hide
        if self.hide {
            sender.setTitle("Show StatusBar", for: UIControlState())
        } else {
            sender.setTitle("Hide StatusBar", for: UIControlState())
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
            self.view.layoutIfNeeded()
        })
    }
}
