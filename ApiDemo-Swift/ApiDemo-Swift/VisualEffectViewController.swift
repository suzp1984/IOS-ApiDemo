//
//  VisualEffectViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/17/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class VisualEffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let mainview = self.view
        let v1 = UIView(frame:CGRectMake(113, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame:CGRectMake(41, 56, 132, 194))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame:CGRectMake(43, 197, 160, 230))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        mainview.addSubview(v1)
        v1.addSubview(v2)
        mainview.addSubview(v3)
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
        blur.frame = mainview.bounds
        blur.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        let vib = UIVisualEffectView(effect: UIVibrancyEffect(
            forBlurEffect: blur.effect as! UIBlurEffect))
        let lab = UILabel()
        lab.text = "Hello, world!"
        lab.sizeToFit()
        vib.frame = lab.frame
        vib.contentView.addSubview(lab)
        vib.center = CGPointMake(blur.bounds.midX, blur.bounds.midY)
        vib.autoresizingMask = [.FlexibleTopMargin, .FlexibleBottomMargin,
                                .FlexibleLeftMargin, .FlexibleRightMargin]
        blur.contentView.addSubview(vib)
        mainview.addSubview(blur)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
