//
//  LayoutMarginViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/10/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class LayoutMarginViewController: UIViewController {

    var didSetup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if self.didSetup {return}
        
        self.didSetup = true
        
        let mainView = self.view
        let v = UIView()
        v.backgroundColor = UIColor.red
        v.translatesAutoresizingMaskIntoConstraints = false
        self.topLayoutGuide
        self.bottomLayoutGuide
        
        mainView?.addSubview(v)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[v]-(0)-|", options: [], metrics: nil, views: ["v":v]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[tlg]-(0)-[v]-(0)-[blg]-|", options: [], metrics: nil, views: ["v":v, "tlg":self.topLayoutGuide, "blg":self.bottomLayoutGuide])
            ].flatMap{$0})
        
        v.preservesSuperviewLayoutMargins = true
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.green
        v1.translatesAutoresizingMaskIntoConstraints = false
        v.addSubview(v1)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v1]-|", options: [], metrics: nil, views: ["v1":v1]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v1]-|", options: [], metrics: nil, views: ["v1":v1])
            ].flatMap{$0})
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
