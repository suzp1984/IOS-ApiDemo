//
//  SwipeGestureRecognizerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/10/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SwipeGestureRecognizerViewController: UIViewController {

    let colors : [UIColor] = [UIColor.yellow, UIColor.black, UIColor.red, UIColor.green, UIColor.brown, UIColor.gray]
    
    var colorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let v = UIView()
        v.backgroundColor = UIColor.red
        v.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        v.center = self.view.center
        
        self.view.addSubview(v)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeLeft.direction = .left
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeUp.direction = .up
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeRight.direction = .right
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(SwipeGestureRecognizerViewController.swipeHandler(_:)))
        swipeDown.direction = .down
        
        v.addGestureRecognizer(swipeLeft)
        v.addGestureRecognizer(swipeUp)
        v.addGestureRecognizer(swipeDown)
        v.addGestureRecognizer(swipeRight)  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func swipeHandler(_ s : UISwipeGestureRecognizer) {
        if let v = s.view {
            v.backgroundColor = colors[colorIndex]
            colorIndex = (colorIndex + 1) % colors.count
        }
    }
}
