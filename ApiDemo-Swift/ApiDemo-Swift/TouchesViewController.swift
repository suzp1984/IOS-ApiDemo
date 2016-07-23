//
//  TouchesViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/23/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class TouchesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        // draggable view
        let v0 = MyEventView0()
        v0.backgroundColor = UIColor.grayColor()
        v0.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v0)
        
        v0.widthAnchor.constraintEqualToConstant(100).active = true
        v0.heightAnchor.constraintEqualToConstant(100).active = true
        v0.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 5).active = true
        v0.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -10).active = true
        
        let label0 = UILabel()
        label0.text = "Draggable"
        v0.addSubview(label0)
        label0.translatesAutoresizingMaskIntoConstraints = false
        label0.centerXAnchor.constraintEqualToAnchor(v0.centerXAnchor, constant: 0).active = true
        label0.centerYAnchor.constraintEqualToAnchor(v0.centerYAnchor, constant: 0).active = true
        
        // draggable h/v
        let v1 = MyEventView1()
        v1.backgroundColor = UIColor.redColor()
        v1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v1)
        v1.widthAnchor.constraintEqualToConstant(100).active = true
        v1.heightAnchor.constraintEqualToConstant(100).active = true
        v1.topAnchor.constraintEqualToAnchor(v0.bottomAnchor, constant: 10).active = true
        v1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 10).active = true
        
        let label1 = UILabel()
        label1.text = "Draggable Horiz/Vert"
        v1.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.centerXAnchor.constraintEqualToAnchor(v1.centerXAnchor, constant: 0).active = true
        label1.centerYAnchor.constraintEqualToAnchor(v1.centerYAnchor, constant: 0).active = true
        
        // single/Double tap
        let v2 = MyEventView2()
        v2.backgroundColor = UIColor.greenColor()
        v2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v2)
        v2.widthAnchor.constraintEqualToConstant(100).active = true
        v2.heightAnchor.constraintEqualToConstant(100).active = true
        v2.topAnchor.constraintEqualToAnchor(v1.bottomAnchor, constant: 10).active = true
        v2.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -10).active = true
        
        let label2 = UILabel()
        label2.text = "Sing/Doub Tap"
        v2.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.centerXAnchor.constraintEqualToAnchor(v2.centerXAnchor, constant: 0).active = true
        label2.centerYAnchor.constraintEqualToAnchor(v2.centerYAnchor, constant: 0).active = true
        
        // Both
        let v3 = MyEventView3()
        v3.backgroundColor = UIColor.yellowColor()
        v3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v3)
        v3.widthAnchor.constraintEqualToConstant(100).active = true
        v3.heightAnchor.constraintEqualToConstant(100).active = true
        v3.topAnchor.constraintEqualToAnchor(v2.bottomAnchor, constant: 10).active = true
        v3.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 10).active = true
        
        let label3 = UILabel()
        label3.text = "Both"
        v3.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.centerXAnchor.constraintEqualToAnchor(v3.centerXAnchor).active = true
        label3.centerYAnchor.constraintEqualToAnchor(v3.centerYAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
