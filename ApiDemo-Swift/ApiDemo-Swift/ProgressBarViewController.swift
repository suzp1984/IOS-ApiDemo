//
//  ProgressBarViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ProgressBarViewController: UIViewController {

    var progress: UIProgressView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let progress = UIProgressView(progressViewStyle: .Default)
        progress.progress = 0.5
        progress.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progress)
        NSLayoutConstraint.activateConstraints([
                progress.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                progress.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
                progress.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20)
            ])
        
        let left = UIButton(type: .System)
        let right = UIButton(type: .System)
        left.setTitle("decrease", forState: .Normal)
        right.setTitle("increase", forState: .Normal)
        left.addTarget(self, action: #selector(ProgressBarViewController.decrease(_:)), forControlEvents: .TouchUpInside)
        right.addTarget(self, action: #selector(ProgressBarViewController.increase(_:)), forControlEvents: .TouchUpInside)
        
        left.translatesAutoresizingMaskIntoConstraints = false
        right.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(left)
        self.view.addSubview(right)
        NSLayoutConstraint.activateConstraints([
            left.topAnchor.constraintEqualToAnchor(progress.bottomAnchor, constant: 30),
            right.topAnchor.constraintEqualToAnchor(progress.bottomAnchor, constant: 30),
            left.rightAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: -20),
            right.leftAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 20)
            ])
        
        self.progress = progress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func increase(sender: UIButton) {
        if let progress = self.progress {
            if progress.progress <= 0.9 {
                progress.setProgress(progress.progress + 0.1, animated: true)
            } else {
                progress.setProgress(1.0, animated: true)
            }
            
        }
    }
    
    func decrease(sender: UIButton) {
        if let progress = self.progress {
            if progress.progress >= 0.1 {
                progress.setProgress(progress.progress - 0.1, animated: true)
            } else {
                progress.setProgress(0, animated: true)
            }
        }
    }

}
