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

        self.view.backgroundColor = UIColor.white
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "First", at: 0, animated: true)
        segment.insertSegment(withTitle: "Second", at: 1, animated: true)
        segment.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segment)
        segment.addTarget(self, action: #selector(SegmentViewController.handleSegment(_:)), for: .valueChanged)
        
        NSLayoutConstraint.activate([
                segment.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                segment.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        // custome segment
        let customeSeg = UISegmentedControl()
        
        let sz = CGSize(width: 100,height: 60)
        let im = imageOfSize(sz) {
            UIImage(named:"linen.png")!.draw(in: CGRect(origin: CGPoint(), size: sz))
            }.resizableImage(
                withCapInsets: UIEdgeInsetsMake(0,10,0,10), resizingMode: .stretch)
        customeSeg.setBackgroundImage(im, for: UIControlState(), barMetrics: .default)
        
        // segment images, redraw at final size
        let pep = ["manny", "moe", "jack"].map {$0 + ".jpg"}
        for (i, boy) in pep.enumerated() {
            print(i)
            print(boy)
            
            let sz = CGSize(width: 30,height: 30)
            let im = imageOfSize(sz) {
                UIImage(named:boy)!.draw(in: CGRect(origin: CGPoint(), size: sz))
                }.withRenderingMode(.alwaysOriginal)
            customeSeg.insertSegment(with: im, at: i, animated: true)
            // customeSeg.setImage(im, forSegmentAtIndex: i)
            customeSeg.setWidth(80, forSegmentAt: i)
        }

        // divider, set at desired width, sufficient to set for Normal only
        let sz2 = CGSize(width: 2,height: 10)
        let div = imageOfSize(sz2) {
            UIColor.white.set()
            UIGraphicsGetCurrentContext()!.fill(CGRect(origin: CGPoint(), size: sz2))
        }
        customeSeg.setDividerImage(div, forLeftSegmentState: UIControlState(), rightSegmentState: UIControlState(), barMetrics: .default)
        
        customeSeg.addTarget(self, action: #selector(SegmentViewController.handleSegment(_:)), for: .valueChanged)
        
        self.view.addSubview(customeSeg)
        customeSeg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                customeSeg.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 40),
                customeSeg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleSegment(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    fileprivate func imageOfSize(_ size:CGSize, closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}
