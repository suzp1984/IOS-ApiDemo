//
//  ImageRenderModeViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/20/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageRenderModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let iv = UIImageView()
        if let image = UIImage(named: "SmileyTemplate") {
            image.withRenderingMode(.automatic)
            iv.tintColor = UIColor.red
            iv.image = image
        }
        
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                iv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                iv.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                iv.widthAnchor.constraint(equalToConstant: 50),
                iv.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        let ib = UIButton()
        ib.tintColor = UIColor.red
        if let image = UIImage(named: "SmileyVector") {
            image.withRenderingMode(.alwaysTemplate)
            ib.setBackgroundImage(image, for: UIControlState())
        }
        
        self.view.addSubview(ib)
        ib.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                ib.topAnchor.constraint(equalTo: iv.bottomAnchor, constant: 10),
                ib.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
