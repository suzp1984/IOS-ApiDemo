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

        self.view.backgroundColor = UIColor.white
        
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0.5
        progress.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progress)
        NSLayoutConstraint.activate([
                progress.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                progress.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
                progress.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
            ])
        
        let left = UIButton(type: .system)
        let right = UIButton(type: .system)
        left.setTitle("decrease", for: UIControlState())
        right.setTitle("increase", for: UIControlState())
        left.addTarget(self, action: #selector(ProgressBarViewController.decrease(_:)), for: .touchUpInside)
        right.addTarget(self, action: #selector(ProgressBarViewController.increase(_:)), for: .touchUpInside)
        
        left.translatesAutoresizingMaskIntoConstraints = false
        right.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(left)
        self.view.addSubview(right)
        NSLayoutConstraint.activate([
            left.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 30),
            right.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 30),
            left.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -20),
            right.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20)
            ])
        
        self.progress = progress
        
        // custome background image progress
        var im : UIImage? = nil
        let customeImgProgress = UIProgressView(progressViewStyle: .default)
        customeImgProgress.backgroundColor = UIColor.black
        customeImgProgress.trackTintColor = UIColor.black
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 10, height: 10), true, 0)
        if let con = UIGraphicsGetCurrentContext() {
            con.setFillColor(UIColor.yellow.cgColor)
            con.fill(CGRect(x: 0, y: 0, width: 10, height: 10))
            let r = con.boundingBoxOfClipPath.insetBy(dx: 1, dy: 1)
            con.setLineWidth(2)
            con.setStrokeColor(UIColor.black.cgColor)
            con.stroke(r)
            con.strokeEllipse(in: r)
            im = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsetsMake(4, 4, 4, 4), resizingMode: .stretch)
        }
        
        UIGraphicsEndImageContext()
        
        if let im = im {
            customeImgProgress.progressImage = im
        }
        
        customeImgProgress.progress = 0.5
        
        customeImgProgress.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customeImgProgress)
        NSLayoutConstraint.activate([
                customeImgProgress.topAnchor.constraint(equalTo: left.bottomAnchor, constant: 30),
                customeImgProgress.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
                customeImgProgress.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
            ])
        self.customeImgProgress = customeImgProgress
        
        // custome progress view
        let customeProgress = MyCustomeProgressView()
        customeProgress.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customeProgress)
        NSLayoutConstraint.activate([
                customeProgress.topAnchor.constraint(equalTo: customeImgProgress.bottomAnchor, constant: 20),
                customeProgress.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
                customeProgress.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
                customeProgress.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        customeProgress.value = 0.5
        
        self.customeProgress = customeProgress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func increase(_ sender: UIButton) {
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
    
    func decrease(_ sender: UIButton) {
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
