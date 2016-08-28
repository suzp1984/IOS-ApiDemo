//
//  CustomeDrawingViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/17/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit


class CustomeDrawingViewController: UIViewController {

    var whitch = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let mv = MyCustomDrawingView()
        mv.which = self.whitch
        
        self.view.addSubview(mv)
        
        mv.translatesAutoresizingMaskIntoConstraints = false
        
        mv.superview!.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-25-[v]-25-|", options: [], metrics: nil, views: ["v":mv])
        )
        mv.superview!.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("V:[v(150)]", options: [], metrics: nil, views: ["v":mv])
        )
        mv.superview!.addConstraint(
            NSLayoutConstraint(item: mv, attribute: .CenterY, relatedBy: .Equal, toItem: mv.superview, attribute: .CenterY, multiplier: 1, constant: 0)
        )
        
        //return; // comment out to experiment with resizing
        
        delay(1) {
            mv.bounds.size.height *= 2
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
