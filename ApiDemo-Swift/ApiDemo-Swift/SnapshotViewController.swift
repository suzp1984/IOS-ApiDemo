//
//  SnapshotViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/17/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class SnapshotViewController: UIViewController {

    var snapshot: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.blueColor()
        self.view.addSubview(v1)
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.widthAnchor.constraintEqualToConstant(100).active = true
        v1.heightAnchor.constraintEqualToConstant(100).active = true
        v1.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 10).active = true
        v1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 10).active = true
        
        let iv = UIImageView(image: UIImage(named: "Mars"))
        // get snapshot
        // let iv = self.view.snapshotViewAfterScreenUpdates(false)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(iv)
        
        NSLayoutConstraint.activateConstraints([
            iv.widthAnchor.constraintEqualToConstant(100),
            iv.heightAnchor.constraintEqualToConstant(100),
            iv.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -10),
            iv.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -10)
            ])
        
        let button = UIButton(type: .System)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Snapshot", forState: .Normal)
        button.addTarget(self, action: #selector(SnapshotViewController.takeSnapshot), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(button)
        NSLayoutConstraint.activateConstraints([
            button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
            button.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func takeSnapshot() {
        if (snapshot != nil) {
            snapshot.removeFromSuperview()
        }
        
        snapshot = self.view.snapshotViewAfterScreenUpdates(false)
        snapshot.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(snapshot)
        
        NSLayoutConstraint.activateConstraints([
            snapshot.widthAnchor.constraintEqualToConstant(100),
            snapshot.heightAnchor.constraintEqualToConstant(200),
            snapshot.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 10),
            snapshot.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -10)
            ])
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
