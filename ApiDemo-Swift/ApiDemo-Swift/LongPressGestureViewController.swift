//
//  LongPressGestureViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/10/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class LongPressGestureViewController: UIViewController {

    let colors : [UIColor] = [UIColor.yellowColor(), UIColor.blackColor(), UIColor.redColor(), UIColor.greenColor(), UIColor.brownColor(), UIColor.grayColor()]
    
    var colorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let v = UIView()
        v.frame = CGRectMake(0, 0, 150, 150)
        v.center = self.view.center
        v.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(v)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(LongPressGestureViewController.longPress(_:)))
        longPress.minimumPressDuration = 2
        longPress.numberOfTouchesRequired = 1
        
        v.addGestureRecognizer(longPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func longPress(l : UILongPressGestureRecognizer) {
        
        if let v = l.view {
            switch l.state {
            case .Began:
                v.backgroundColor = colors[colorIndex]
                colorIndex = (colorIndex + 1) % colors.count
            default:
                break
            }
            
        }
    }

}
