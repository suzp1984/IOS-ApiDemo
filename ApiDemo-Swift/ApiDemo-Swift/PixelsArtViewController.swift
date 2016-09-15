//
//  PixelsArtViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/11/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PixelsArtViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        let pixels = PixelsArtView()
        pixels.frame = self.view.bounds
        pixels.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(pixels)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
