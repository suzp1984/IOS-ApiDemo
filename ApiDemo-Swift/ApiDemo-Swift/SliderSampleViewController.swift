//
//  SliderSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SliderSampleViewController: UIViewController {

    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(slider)
        
        NSLayoutConstraint.activateConstraints([
                slider.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                slider.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                slider.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, constant: -40)
            ])
        
        slider.addTarget(self, action: #selector(SliderSampleViewController.sliderValue(_:)), forControlEvents: .ValueChanged)
        
        self.label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        NSLayoutConstraint.activateConstraints([
                label.topAnchor.constraintEqualToAnchor(slider.bottomAnchor, constant: 10),
                label.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        
        // custome slider
        //let mySlider = MySlider()
        //mySlider.translatesAutoresizingMaskIntoConstraints = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sliderValue(sender: UISlider) {
        label.text = String(sender.value)
        // print(sender.value)
    }
}
