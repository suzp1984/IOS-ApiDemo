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
    var customeImgProgress: UIProgressView?
    var customeProgress : MyCustomeProgressView?
    
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
        
        // custome background image progress
        var im : UIImage? = nil
        let customeImgProgress = UIProgressView(progressViewStyle: .Default)
        customeImgProgress.backgroundColor = UIColor.blackColor()
        customeImgProgress.trackTintColor = UIColor.blackColor()
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(10, 10), true, 0)
        if let con = UIGraphicsGetCurrentContext() {
            CGContextSetFillColorWithColor(con, UIColor.yellowColor().CGColor)
            CGContextFillRect(con, CGRectMake(0, 0, 10, 10))
            let r = CGRectInset(CGContextGetClipBoundingBox(con), 1, 1)
            CGContextSetLineWidth(con, 2)
            CGContextSetStrokeColorWithColor(con, UIColor.blackColor().CGColor)
            CGContextStrokeRect(con, r)
            CGContextStrokeEllipseInRect(con, r)
            im = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsMake(4, 4, 4, 4), resizingMode: .Stretch)
        }
        
        UIGraphicsEndImageContext()
        
        if let im = im {
            customeImgProgress.progressImage = im
        }
        
        customeImgProgress.progress = 0.5
        
        customeImgProgress.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customeImgProgress)
        NSLayoutConstraint.activateConstraints([
                customeImgProgress.topAnchor.constraintEqualToAnchor(left.bottomAnchor, constant: 30),
                customeImgProgress.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
                customeImgProgress.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20)
            ])
        self.customeImgProgress = customeImgProgress
        
        // custome progress view
        let customeProgress = MyCustomeProgressView()
        customeProgress.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customeProgress)
        NSLayoutConstraint.activateConstraints([
                customeProgress.topAnchor.constraintEqualToAnchor(customeImgProgress.bottomAnchor, constant: 20),
                customeProgress.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
                customeProgress.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20),
                customeProgress.heightAnchor.constraintEqualToConstant(20)
            ])
        
        customeProgress.value = 0.5
        
        self.customeProgress = customeProgress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func increase(sender: UIButton) {
        if let progress = self.progress, let customeImgProgress = self.customeImgProgress,
                let customeProgress = self.customeProgress {
            if progress.progress <= 0.9 {
                progress.setProgress(progress.progress + 0.1, animated: true)
                customeImgProgress.setProgress(progress.progress + 0.1, animated: true)
                customeProgress.value = CGFloat(progress.progress + 0.1)
                //customeProgress.setNeedsDisplay()
            } else {
                progress.setProgress(1.0, animated: true)
                customeImgProgress.setProgress(1.0, animated: true)
                customeProgress.value = 1.0
                //customeProgress.setNeedsDisplay()
            }
            
        }
    }
    
    func decrease(sender: UIButton) {
        if let progress = self.progress, let customeImgProgress = self.customeImgProgress,
            let customeProgress = self.customeProgress {
            if progress.progress >= 0.1 {
                progress.setProgress(progress.progress - 0.1, animated: true)
                customeImgProgress.setProgress(progress.progress - 0.1, animated: true)
                customeProgress.value = CGFloat(progress.progress - 0.1)
                //customeProgress.setNeedsDisplay()
            } else {
                progress.setProgress(0, animated: true)
                customeImgProgress.setProgress(0, animated: true)
                customeProgress.value = 0
                //customeProgress.setNeedsDisplay()
            }
        }
    }

}
