//
//  ResizingViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/3/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class ResizingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        let v1 = UIView(frame: CGRectMake(100, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame: CGRectMake(0, 0, 132, 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame: CGRectMake(v1.bounds.width - 20, v1.bounds.height - 20, 20, 20))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        
        v2.autoresizingMask = .FlexibleWidth
        v3.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin]
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
