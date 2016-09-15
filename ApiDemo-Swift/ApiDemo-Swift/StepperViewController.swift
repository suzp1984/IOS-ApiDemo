//
//  StepperViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {

    var label : UILabel!
    var customeLable : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stepper)
        NSLayoutConstraint.activate([
                stepper.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                stepper.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
            ])
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        self.label = label
        
        NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        stepper.addTarget(self, action: #selector(StepperViewController.stepperEvent(_:)), for: .valueChanged)
        
        // custome stepper
        let customeStepper = UIStepper()
        customeStepper.tintColor = UIColor.yellow
        
        let imdis = UIImage(named: "pic2.png")!
            .resizableImage(
                withCapInsets: UIEdgeInsetsMake(1, 1, 1, 1), resizingMode:.stretch)
        customeStepper.setBackgroundImage(imdis, for:.disabled)
        
        let imnorm = UIImage(named: "pic1.png")!
            .resizableImage(
                withCapInsets: UIEdgeInsetsMake(1, 1, 1, 1), resizingMode:.stretch)
        customeStepper.setBackgroundImage(imnorm, for:UIControlState())
        
        let tint = imageOfSize(CGSize(width: 3,height: 3)) {
            customeStepper.tintColor.setFill()
            UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0,y: 0,width: 3,height: 3))
            }.resizableImage(
                withCapInsets: UIEdgeInsetsMake(1, 1, 1, 1), resizingMode:.stretch)
        customeStepper.setDividerImage(tint, forLeftSegmentState:UIControlState(), rightSegmentState:UIControlState())
        customeStepper.setDividerImage(tint, forLeftSegmentState:.highlighted, rightSegmentState:UIControlState())
        customeStepper.setDividerImage(tint, forLeftSegmentState:UIControlState(), rightSegmentState:.highlighted)
        
        let imleft = imageOfSize(CGSize(width: 45,height: 29)) {
            NSAttributedString(string:"\u{21DA}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.white,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .center
                }
                ]).draw(in: CGRect(x: 0,y: -5,width: 45,height: 29))
            }.withRenderingMode(.alwaysOriginal)
        customeStepper.setDecrementImage(imleft, for:UIControlState())
        
        let imleftblack = imageOfSize(CGSize(width: 45,height: 29)) {
            NSAttributedString(string:"\u{21DA}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.black,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .center
                }
                ]).draw(in: CGRect(x: 0,y: -5,width: 45,height: 29))
            }.withRenderingMode(.alwaysOriginal)
        customeStepper.setDecrementImage(imleftblack, for:.disabled)
        
        let imlefttint = imageOfSize(CGSize(width: 45,height: 29)) {
            NSAttributedString(string:"\u{21DA}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: customeStepper.tintColor,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .center
                }
                ]).draw(in: CGRect(x: 0,y: -5,width: 45,height: 29))
            }.withRenderingMode(.alwaysOriginal)
        customeStepper.setDecrementImage(imlefttint, for:.highlighted)
        
        let imright = imageOfSize(CGSize(width: 45,height: 29)) {
            NSAttributedString(string:"\u{21DB}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.white,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .center
                }
                ]).draw(in: CGRect(x: 0,y: -5,width: 45,height: 29))
            }.withRenderingMode(.alwaysOriginal)
        customeStepper.setIncrementImage(imright, for:UIControlState())
        
        let imrightblack = imageOfSize(CGSize(width: 45,height: 29)) {
            NSAttributedString(string:"\u{21DB}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.black,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .center
                }
                ]).draw(in: CGRect(x: 0,y: -5,width: 45,height: 29))
            }.withRenderingMode(.alwaysOriginal)
        customeStepper.setIncrementImage(imrightblack, for:.disabled)
        
        let imrighttint = imageOfSize(CGSize(width: 45,height: 29)) {
            NSAttributedString(string:"\u{21DB}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: customeStepper.tintColor,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .center
                }
                ]).draw(in: CGRect(x: 0,y: -5,width: 45,height: 29))
            }.withRenderingMode(.alwaysOriginal)
        customeStepper.setIncrementImage(imrighttint, for:.highlighted)

        self.view.addSubview(customeStepper)
        customeStepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                customeStepper.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 20),
                customeStepper.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
            ])
        
        customeStepper.maximumValue = 10
        customeStepper.minimumValue = 0
        customeStepper.stepValue = 1
        customeStepper.value = 0
        
        self.customeLable = UILabel()
        self.customeLable.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.customeLable)
        NSLayoutConstraint.activate([
                self.customeLable.topAnchor.constraint(equalTo: customeStepper.topAnchor),
                self.customeLable.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        customeStepper.addTarget(self, action: #selector(StepperViewController.customeStepperEvent(_:)), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func imageOfSize(_ size:CGSize, closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    fileprivate func lend<T> (_ closure:(T)->()) -> T where T:NSObject {
        let orig = T()
        closure(orig)
        return orig
    }

    func stepperEvent(_ sender: UIStepper) {
        self.label.text = String(sender.value)
    }
    
    func customeStepperEvent(_ sender: UIStepper) {
        self.customeLable.text = String(sender.value)
    }
}
