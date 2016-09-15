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

        self.view.backgroundColor = UIColor.white
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(slider)
        
        NSLayoutConstraint.activate([
                slider.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                slider.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                slider.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40)
            ])
        
        slider.addTarget(self, action: #selector(SliderSampleViewController.sliderValue(_:)), for: .valueChanged)
        
        self.label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
                label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        // custome slider
        //let mySlider = MySlider()
        //mySlider.translatesAutoresizingMaskIntoConstraints = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sliderValue(_ sender: UISlider) {
        label.text = String(sender.value)
        // print(sender.value)
    }
}
