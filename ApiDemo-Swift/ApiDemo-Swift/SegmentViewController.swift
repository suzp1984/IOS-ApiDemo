//
//  SegmentViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SegmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        let segment = UISegmentedControl()
        segment.insertSegmentWithTitle("First", atIndex: 0, animated: true)
        segment.insertSegmentWithTitle("Second", atIndex: 1, animated: true)
        segment.insertSegmentWithTitle("Third", atIndex: 2, animated: true)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segment)
        segment.addTarget(self, action: #selector(SegmentViewController.handleSegment(_:)), forControlEvents: .ValueChanged)
        
        NSLayoutConstraint.activateConstraints([
                segment.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                segment.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        
        // custome segment
        let customeSeg = UISegmentedControl()
        
        let sz = CGSizeMake(100,60)
        let im = imageOfSize(sz) {
            UIImage(named:"linen.png")!.drawInRect(CGRect(origin: CGPoint(), size: sz))
            }.resizableImageWithCapInsets(
                UIEdgeInsetsMake(0,10,0,10), resizingMode: .Stretch)
        customeSeg.setBackgroundImage(im, forState: .Normal, barMetrics: .Default)
        
        // segment images, redraw at final size
        let pep = ["manny", "moe", "jack"].map {$0 + ".jpg"}
        for (i, boy) in pep.enumerate() {
            print(i)
            print(boy)
            
            let sz = CGSizeMake(30,30)
            let im = imageOfSize(sz) {
                UIImage(named:boy)!.drawInRect(CGRect(origin: CGPoint(), size: sz))
                }.imageWithRenderingMode(.AlwaysOriginal)
            customeSeg.insertSegmentWithImage(im, atIndex: i, animated: true)
            // customeSeg.setImage(im, forSegmentAtIndex: i)
            customeSeg.setWidth(80, forSegmentAtIndex: i)
        }

        // divider, set at desired width, sufficient to set for Normal only
        let sz2 = CGSizeMake(2,10)
        let div = imageOfSize(sz2) {
            UIColor.whiteColor().set()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRect(origin: CGPoint(), size: sz2))
        }
        customeSeg.setDividerImage(div, forLeftSegmentState: .Normal, rightSegmentState: .Normal, barMetrics: .Default)
        
        customeSeg.addTarget(self, action: #selector(SegmentViewController.handleSegment(_:)), forControlEvents: .ValueChanged)
        
        self.view.addSubview(customeSeg)
        customeSeg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                customeSeg.topAnchor.constraintEqualToAnchor(segment.bottomAnchor, constant: 40),
                customeSeg.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleSegment(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    private func imageOfSize(size:CGSize, closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
