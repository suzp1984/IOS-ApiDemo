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

        self.view.backgroundColor = UIColor.white
        
        let label1 = UILabel()
        label1.text = "A sane and stupied label"
        
        let label2 = UILabel()
        label2.text = "Gellory Gellory Holiday"
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label1)
        self.view.addSubview(label2)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 30),
            label1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
            label2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // set label2 font
        
        // print all font family and its fontnames first
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        let font2Name = "SourceCodePro-Regular"
        let f2 = UIFont(name: font2Name, size: 20)
        if let f2 = f2 {
            label2.font = f2
        }

        
        // set lable1 fonts
        label1.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        
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
                case .didBegin:
                    NSLog("%@", "matching did begin")
                case .willBeginDownloading:
                    NSLog("%@", "downloading will begin")
                case .downloading:
                    let d = prog as NSDictionary
                    let key = kCTFontDescriptorMatchingPercentage
                    let cur : AnyObject? = d[key as NSString]
                    if let cur = cur as? NSNumber {
                        NSLog("progress: %@%%", cur)
                    }
                case .didFinishDownloading:
                    NSLog("%@", "downloading did finish")
                case .didFailWithError:
                    NSLog("%@", "downloading failed")
                case .didFinish:
                    NSLog("%@", "matching did finish")
                    DispatchQueue.main.async(execute: {
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
