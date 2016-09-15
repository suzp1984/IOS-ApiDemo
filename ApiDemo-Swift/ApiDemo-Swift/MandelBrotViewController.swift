//
//  MandelBrotViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/11/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MandelBrotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let mandelbrot = MandelbrotDrawView()
        mandelbrot.frame = self.view.bounds
        mandelbrot.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(mandelbrot)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
