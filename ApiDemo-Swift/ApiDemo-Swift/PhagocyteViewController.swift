//
//  PhagocyteViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/23/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PhagocyteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let phagocyte = PhagocyteView()
        // phagocyte.frame = self.view.bounds
        phagocyte.frame = CGRect(x: 0, y: 0, width: 1024, height: 1024)
        phagocyte.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(phagocyte)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
