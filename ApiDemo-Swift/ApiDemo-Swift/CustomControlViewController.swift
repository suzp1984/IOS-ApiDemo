//
//  CustomControlViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class CustomControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let knob = MyKnob()
        knob.backgroundColor = UIColor.clear
        knob.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(knob)
        
        NSLayoutConstraint.activate([
                knob.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                knob.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                knob.widthAnchor.constraint(equalToConstant: 150),
                knob.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        knob.addTarget(self, action: #selector(CustomControlViewController.handleKnobRotate(_:)), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleKnobRotate(_ sender: MyKnob) {
        print(sender.angle)
    }
}
