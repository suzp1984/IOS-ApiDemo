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

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let v1 = UIView(frame: CGRect(x: 100, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame: CGRect(x: 0, y: 0, width: 132, height: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame: CGRect(x: v1.bounds.width - 20, y: v1.bounds.height - 20, width: 20, height: 20))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        
        v2.autoresizingMask = .flexibleWidth
        v3.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin]
        
        delay(2, closure: {
            v1.bounds.size.width += 20
            v1.bounds.size.height -= 20
        })
        
        delay(4) {
            v1.bounds.size.width += 20
            v1.bounds.size.height -= 40
        }
        
        delay(6) {
            v1.bounds.size.width -= 40
            v1.bounds.size.height += 60
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
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
