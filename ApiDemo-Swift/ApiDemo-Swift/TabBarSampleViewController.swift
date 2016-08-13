//
//  TabBarSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/13/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class TabBarSampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        let btn = UIButton(type: .System)
        btn.setTitle("go to Tabbar", forState: .Normal)
        btn.addTarget(self, action: #selector(TabBarSampleViewController.doPresent(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                btn.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                btn.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doPresent(sender: UIButton) {
        let tabControl = UITabBarController()
        let first = SecondPresentViewController()
        first.tabBarItem = UITabBarItem(tabBarSystemItem: .Bookmarks, tag: 0)
        let third = ThirdPresentViewController()
        third.tabBarItem = UITabBarItem(tabBarSystemItem: .Contacts, tag: 1)
        
        tabControl.viewControllers = [first, third]
        tabControl.selectedIndex = 1
        
        // UITabBarItem(tabBarSystemItem: .Bookmarks, tag: 0)
        
        self.presentViewController(tabControl, animated: true, completion: nil)
    }

}
