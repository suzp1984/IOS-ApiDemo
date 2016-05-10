//
//  StackViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/10/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let stackView = UIStackView()
        stackView.axis = .Vertical
        stackView.distribution = .EqualCentering
        stackView.alignment = .Center
        stackView.layoutMarginsRelativeArrangement = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activateConstraints([
            stackView.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor),
            stackView.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor),
            stackView.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor)
            ])
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.redColor()
        v1.heightAnchor.constraintEqualToConstant(100).active = true
        v1.widthAnchor.constraintEqualToConstant(120).active = true
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.greenColor()
        v2.heightAnchor.constraintEqualToConstant(100).active = true
        v2.widthAnchor.constraintEqualToConstant(120).active = true
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.yellowColor()
        v3.heightAnchor.constraintEqualToConstant(100).active = true
        v3.widthAnchor.constraintEqualToConstant(120).active = true
        
        stackView.addArrangedSubview(v1)
        stackView.addArrangedSubview(v2)
        stackView.addArrangedSubview(v3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
