//
//  SwipeGestureRecognizerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/10/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SwipeGestureRecognizerViewController: UIViewController {

    let colors : [UIColor] = [UIColor.yellowColor(), UIColor.blackColor(), UIColor.redColor(), UIColor.greenColor(), UIColor.brownColor(), UIColor.grayColor()]
    
    var colorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let v = UIView()
        v.backgroundColor = UIColor.redColor()
        v.frame = CGRectMake(0, 0, 150, 150)
        v.center = self.view.center
        
        self.view.addSubview(v)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeLeft.direction = .Left
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeUp.direction = .Up
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeRight.direction = .Right
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeDown.direction = .Down
        
        v.addGestureRecognizer(swipeLeft)
        v.addGestureRecognizer(swipeUp)
        v.addGestureRecognizer(swipeDown)
        v.addGestureRecognizer(swipeRight)  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func swipeHandler(s : UISwipeGestureRecognizer) {
        if let v = s.view {
            v.backgroundColor = colors[colorIndex]
            colorIndex = (colorIndex + 1) % colors.count
        }
    }
}
