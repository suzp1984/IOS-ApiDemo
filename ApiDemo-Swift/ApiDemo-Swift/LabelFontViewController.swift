//
//  LabelFontViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/28/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class LabelFontViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let label1 = UILabel()
        label1.text = "A sane and stupied label"
        
        let label2 = UILabel()
        label2.text = "Gellory Gellory Holiday"
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label1)
        self.view.addSubview(label2)
        
        NSLayoutConstraint.activateConstraints([
            label1.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 30),
            label1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
            label2.topAnchor.constraintEqualToAnchor(label1.bottomAnchor, constant: 20),
            label2.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // set lable1 fonts
        label1.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        
        let name = "NanumBrush" // another one to try: YuppySC-Regular, also good old LucidaGrande
        let size : CGFloat = 24
        let f : UIFont! = UIFont(name:name, size:size)
        if f != nil {
            label1.font = f
            print("already installed")
            return
        }
        print("attempting to download font")
        let desc = UIFontDescriptor(name:name, size:size)
        CTFontDescriptorMatchFontDescriptorsWithProgressHandler(
            [desc], nil, {
                (state:CTFontDescriptorMatchingState, prog:CFDictionary!) -> Bool in
                switch state {
                case .DidBegin:
                    NSLog("%@", "matching did begin")
                case .WillBeginDownloading:
                    NSLog("%@", "downloading will begin")
                case .Downloading:
                    let d = prog as NSDictionary
                    let key = kCTFontDescriptorMatchingPercentage
                    let cur : AnyObject? = d[key as NSString]
                    if let cur = cur as? NSNumber {
                        NSLog("progress: %@%%", cur)
                    }
                case .DidFinishDownloading:
                    NSLog("%@", "downloading did finish")
                case .DidFailWithError:
                    NSLog("%@", "downloading failed")
                case .DidFinish:
                    NSLog("%@", "matching did finish")
                    dispatch_async(dispatch_get_main_queue(), {
                        let f : UIFont! = UIFont(name:name, size:size)
                        if f != nil {
                            NSLog("%@", "got the font!")
                            label1.font = f
                        }
                    })
                default:break
                }
                return true
        })

        // set label2 font 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
