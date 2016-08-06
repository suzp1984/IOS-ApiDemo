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
        self.view.backgroundColor = UIColor.whiteColor()
        
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stepper)
        NSLayoutConstraint.activateConstraints([
                stepper.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                stepper.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20)
            ])
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        self.label = label
        
        NSLayoutConstraint.activateConstraints([
                label.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                label.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        stepper.addTarget(self, action: #selector(StepperViewController.stepperEvent(_:)), forControlEvents: .ValueChanged)
        
        // custome stepper
        let customeStepper = UIStepper()
        customeStepper.tintColor = UIColor.yellowColor()
        
        let imdis = UIImage(named: "pic2.png")!
            .resizableImageWithCapInsets(
                UIEdgeInsetsMake(1, 1, 1, 1), resizingMode:.Stretch)
        customeStepper.setBackgroundImage(imdis, forState:.Disabled)
        
        let imnorm = UIImage(named: "pic1.png")!
            .resizableImageWithCapInsets(
                UIEdgeInsetsMake(1, 1, 1, 1), resizingMode:.Stretch)
        customeStepper.setBackgroundImage(imnorm, forState:.Normal)
        
        let tint = imageOfSize(CGSizeMake(3,3)) {
            customeStepper.tintColor.setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0,0,3,3))
            }.resizableImageWithCapInsets(
                UIEdgeInsetsMake(1, 1, 1, 1), resizingMode:.Stretch)
        customeStepper.setDividerImage(tint, forLeftSegmentState:.Normal, rightSegmentState:.Normal)
        customeStepper.setDividerImage(tint, forLeftSegmentState:.Highlighted, rightSegmentState:.Normal)
        customeStepper.setDividerImage(tint, forLeftSegmentState:.Normal, rightSegmentState:.Highlighted)
        
        let imleft = imageOfSize(CGSizeMake(45,29)) {
            NSAttributedString(string:"\u{21DA}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .Center
                }
                ]).drawInRect(CGRectMake(0,-5,45,29))
            }.imageWithRenderingMode(.AlwaysOriginal)
        customeStepper.setDecrementImage(imleft, forState:.Normal)
        
        let imleftblack = imageOfSize(CGSizeMake(45,29)) {
            NSAttributedString(string:"\u{21DA}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.blackColor(),
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .Center
                }
                ]).drawInRect(CGRectMake(0,-5,45,29))
            }.imageWithRenderingMode(.AlwaysOriginal)
        customeStepper.setDecrementImage(imleftblack, forState:.Disabled)
        
        let imlefttint = imageOfSize(CGSizeMake(45,29)) {
            NSAttributedString(string:"\u{21DA}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: customeStepper.tintColor,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .Center
                }
                ]).drawInRect(CGRectMake(0,-5,45,29))
            }.imageWithRenderingMode(.AlwaysOriginal)
        customeStepper.setDecrementImage(imlefttint, forState:.Highlighted)
        
        let imright = imageOfSize(CGSizeMake(45,29)) {
            NSAttributedString(string:"\u{21DB}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .Center
                }
                ]).drawInRect(CGRectMake(0,-5,45,29))
            }.imageWithRenderingMode(.AlwaysOriginal)
        customeStepper.setIncrementImage(imright, forState:.Normal)
        
        let imrightblack = imageOfSize(CGSizeMake(45,29)) {
            NSAttributedString(string:"\u{21DB}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: UIColor.blackColor(),
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .Center
                }
                ]).drawInRect(CGRectMake(0,-5,45,29))
            }.imageWithRenderingMode(.AlwaysOriginal)
        customeStepper.setIncrementImage(imrightblack, forState:.Disabled)
        
        let imrighttint = imageOfSize(CGSizeMake(45,29)) {
            NSAttributedString(string:"\u{21DB}", attributes:[
                NSFontAttributeName: UIFont(name:"GillSans-Bold", size:30)!,
                NSForegroundColorAttributeName: customeStepper.tintColor,
                NSParagraphStyleAttributeName: self.lend {
                    (para : NSMutableParagraphStyle) in
                    para.alignment = .Center
                }
                ]).drawInRect(CGRectMake(0,-5,45,29))
            }.imageWithRenderingMode(.AlwaysOriginal)
        customeStepper.setIncrementImage(imrighttint, forState:.Highlighted)

        self.view.addSubview(customeStepper)
        customeStepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                customeStepper.topAnchor.constraintEqualToAnchor(stepper.bottomAnchor, constant: 20),
                customeStepper.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20)
            ])
        
        customeStepper.maximumValue = 10
        customeStepper.minimumValue = 0
        customeStepper.stepValue = 1
        customeStepper.value = 0
        
        self.customeLable = UILabel()
        self.customeLable.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.customeLable)
        NSLayoutConstraint.activateConstraints([
                self.customeLable.topAnchor.constraintEqualToAnchor(customeStepper.topAnchor),
                self.customeLable.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        customeStepper.addTarget(self, action: #selector(StepperViewController.customeStepperEvent(_:)), forControlEvents: .ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func imageOfSize(size:CGSize, closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    private func lend<T where T:NSObject> (closure:(T)->()) -> T {
        let orig = T()
        closure(orig)
        return orig
    }

    func stepperEvent(sender: UIStepper) {
        self.label.text = String(sender.value)
    }
    
    func customeStepperEvent(sender: UIStepper) {
        self.customeLable.text = String(sender.value)
    }
}
