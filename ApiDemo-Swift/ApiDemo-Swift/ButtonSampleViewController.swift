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

        self.view.backgroundColor = UIColor.white
        
        let button = MyShrinkingButton(type: .system)
        
        let im = UIImage(named:"coin2.png")!
        let sz = im.size
        let im2 = im.resizableImage(withCapInsets: UIEdgeInsetsMake(
            sz.height/2, sz.width/2, sz.height/2, sz.width/2),
                                                 resizingMode: .stretch)
        button.setBackgroundImage(im2, for: UIControlState())
        button.backgroundColor = UIColor.clear
        button.setImage(im2, for: UIControlState())
        
        let mas = NSMutableAttributedString(string: "Pay Tribute", attributes: [
            NSFontAttributeName: UIFont(name:"GillSans-Bold", size:16)!,
            NSForegroundColorAttributeName: UIColor.purple,
            // in iOS 8.3 can comment out next line; bug is fixed
            // NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleNone.rawValue
            ])
        mas.addAttributes([
            NSStrokeColorAttributeName: UIColor.red,
            NSStrokeWidthAttributeName: -2,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue
            ], range: NSMakeRange(4, mas.length-4))
        button.setAttributedTitle(mas, for: UIControlState())
        
        let mas2 = mas.mutableCopy() as! NSMutableAttributedString
        mas2.addAttributes([
            NSForegroundColorAttributeName: UIColor.white
            ], range: NSMakeRange(0, mas2.length))
        button.setAttributedTitle(mas2, for: .highlighted)
        
        button.adjustsImageWhenHighlighted = true

        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        
        let button2 = UIButton(type: .system)
        button2.titleLabel!.numberOfLines = 2
        button2.titleLabel!.textAlignment = .center
        button2.setTitle("Button with a title that wraps", for: UIControlState())
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button2)
        NSLayoutConstraint.activate([
                button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
                button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                button2.widthAnchor.constraint(equalToConstant: 150)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
