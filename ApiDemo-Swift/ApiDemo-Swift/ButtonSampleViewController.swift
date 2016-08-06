//
//  ButtonSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ButtonSampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = MyShrinkingButton(type: .System)
        
        let im = UIImage(named:"coin2.png")!
        let sz = im.size
        let im2 = im.resizableImageWithCapInsets(UIEdgeInsetsMake(
            sz.height/2, sz.width/2, sz.height/2, sz.width/2),
                                                 resizingMode: .Stretch)
        button.setBackgroundImage(im2, forState: .Normal)
        button.backgroundColor = UIColor.clearColor()
        button.setImage(im2, forState: .Normal)
        
        let mas = NSMutableAttributedString(string: "Pay Tribute", attributes: [
            NSFontAttributeName: UIFont(name:"GillSans-Bold", size:16)!,
            NSForegroundColorAttributeName: UIColor.purpleColor(),
            // in iOS 8.3 can comment out next line; bug is fixed
            // NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleNone.rawValue
            ])
        mas.addAttributes([
            NSStrokeColorAttributeName: UIColor.redColor(),
            NSStrokeWidthAttributeName: -2,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue
            ], range: NSMakeRange(4, mas.length-4))
        button.setAttributedTitle(mas, forState: .Normal)
        
        let mas2 = mas.mutableCopy() as! NSMutableAttributedString
        mas2.addAttributes([
            NSForegroundColorAttributeName: UIColor.whiteColor()
            ], range: NSMakeRange(0, mas2.length))
        button.setAttributedTitle(mas2, forState: .Highlighted)
        
        button.adjustsImageWhenHighlighted = true

        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        NSLayoutConstraint.activateConstraints([
                button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                button.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        
        
        let button2 = UIButton(type: .System)
        button2.titleLabel!.numberOfLines = 2
        button2.titleLabel!.textAlignment = .Center
        button2.setTitle("Button with a title that wraps", forState: .Normal)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button2)
        NSLayoutConstraint.activateConstraints([
                button2.topAnchor.constraintEqualToAnchor(button.bottomAnchor, constant: 20),
                button2.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                button2.widthAnchor.constraintEqualToConstant(150)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
