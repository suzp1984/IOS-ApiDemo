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
        self.view.backgroundColor = UIColor.white
        
        
        let btn = UIButton(type: .system)
        btn.setTitle("go to Tabbar", for: UIControlState())
        btn.addTarget(self, action: #selector(TabBarSampleViewController.doPresent(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doPresent(_ sender: UIButton) {
        let tabControl = UITabBarController()
        let first = SecondPresentViewController()
        first.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let third = ThirdPresentViewController()
        third.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        tabControl.viewControllers = [first, third]
        tabControl.selectedIndex = 1
        
        // UITabBarItem(tabBarSystemItem: .Bookmarks, tag: 0)
        
        self.present(tabControl, animated: true, completion: nil)
    }

}
