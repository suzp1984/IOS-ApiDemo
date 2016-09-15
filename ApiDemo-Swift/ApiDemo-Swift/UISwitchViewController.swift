//
//  UISwitchViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class UISwitchViewController: UIViewController {

    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let switcher = UISwitch()
        
        switcher.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(switcher)
        NSLayoutConstraint.activate([
                switcher.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                switcher.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
            ])
        
        switcher.addTarget(self, action: #selector(UISwitchViewController.switchValue(_:)), for: .valueChanged)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        self.label = label
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func switchValue(_ sender: UISwitch) {
        self.label.text = sender.isOn ? "Switch On" : "Switch Off"
    }
}
