//
//  SliderBubbleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SliderBubbleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let bubble = SliderBubbleView()
        bubble.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(bubble)
        NSLayoutConstraint.activate([
                bubble.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                bubble.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                bubble.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
