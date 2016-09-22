//
//  KastenSecondViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/22/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class KastenSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let kasten = ManuelKastenSecondView()
        kasten.frame = CGRect(x: 0, y: 0, width: 1024, height: 1024)
        // kasten.frame = self.view.bounds
        kasten.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(kasten)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
