//
//  SnapshotViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/17/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SnapshotViewController: UIViewController {

    var snapshot: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.blue
        self.view.addSubview(v1)
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v1.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        v1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        
        let iv = UIImageView(image: UIImage(named: "Mars"))
        // get snapshot
        // let iv = self.view.snapshotViewAfterScreenUpdates(false)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(iv)
        
        NSLayoutConstraint.activate([
            iv.widthAnchor.constraint(equalToConstant: 100),
            iv.heightAnchor.constraint(equalToConstant: 100),
            iv.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            iv.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -10)
            ])
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Snapshot", for: UIControlState())
        button.addTarget(self, action: #selector(SnapshotViewController.takeSnapshot), for: .touchUpInside)
        
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
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
        
        snapshot = self.view.snapshotView(afterScreenUpdates: false)
        snapshot.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(snapshot)
        
        NSLayoutConstraint.activate([
            snapshot.widthAnchor.constraint(equalToConstant: 100),
            snapshot.heightAnchor.constraint(equalToConstant: 200),
            snapshot.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            snapshot.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -10)
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
