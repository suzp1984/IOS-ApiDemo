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

        self.view.backgroundColor = UIColor.white
        
        // draggable view
        let v0 = MyEventView0()
        v0.backgroundColor = UIColor.gray
        v0.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v0)
        
        v0.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v0.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 5).isActive = true
        v0.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        
        let label0 = UILabel()
        label0.text = "Draggable"
        v0.addSubview(label0)
        label0.translatesAutoresizingMaskIntoConstraints = false
        label0.centerXAnchor.constraint(equalTo: v0.centerXAnchor, constant: 0).isActive = true
        label0.centerYAnchor.constraint(equalTo: v0.centerYAnchor, constant: 0).isActive = true
        
        // draggable h/v
        let v1 = MyEventView1()
        v1.backgroundColor = UIColor.red
        v1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v1)
        v1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v1.topAnchor.constraint(equalTo: v0.bottomAnchor, constant: 10).isActive = true
        v1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        
        let label1 = UILabel()
        label1.text = "Draggable Horiz/Vert"
        v1.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.centerXAnchor.constraint(equalTo: v1.centerXAnchor, constant: 0).isActive = true
        label1.centerYAnchor.constraint(equalTo: v1.centerYAnchor, constant: 0).isActive = true
        
        // single/Double tap
        let v2 = MyEventView2()
        v2.backgroundColor = UIColor.green
        v2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v2)
        v2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v2.topAnchor.constraint(equalTo: v1.bottomAnchor, constant: 10).isActive = true
        v2.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        
        let label2 = UILabel()
        label2.text = "Sing/Doub Tap"
        v2.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.centerXAnchor.constraint(equalTo: v2.centerXAnchor, constant: 0).isActive = true
        label2.centerYAnchor.constraint(equalTo: v2.centerYAnchor, constant: 0).isActive = true
        
        // Both
        let v3 = MyEventView3()
        v3.backgroundColor = UIColor.yellow
        v3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v3)
        v3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v3.topAnchor.constraint(equalTo: v2.bottomAnchor, constant: 10).isActive = true
        v3.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        
        let label3 = UILabel()
        label3.text = "Both"
        v3.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.centerXAnchor.constraint(equalTo: v3.centerXAnchor).isActive = true
        label3.centerYAnchor.constraint(equalTo: v3.centerYAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
