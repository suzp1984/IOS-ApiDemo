//
//  AutoResizeScrollViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/26/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class AutoResizeScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let sv = UIScrollView(frame: self.view.bounds)
        sv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(sv)
        sv.backgroundColor = UIColor.white
        
        var y : CGFloat = 10
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.text = "This is Lable \(i+1)"
            lab.sizeToFit()
            lab.frame.origin = CGPoint(x: 10, y: y)
            sv.addSubview(lab)
            y += lab.bounds.size.height + 10
        }
        
        var sz = sv.bounds.size
        sz.height = y
        sv.contentSize = sz
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
