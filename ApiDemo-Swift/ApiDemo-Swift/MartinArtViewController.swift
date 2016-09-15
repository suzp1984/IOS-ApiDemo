//
//  MartinArtViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/12/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MartinArtViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let martinView = MartinView()
        martinView.frame = self.view.bounds
        martinView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(martinView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
