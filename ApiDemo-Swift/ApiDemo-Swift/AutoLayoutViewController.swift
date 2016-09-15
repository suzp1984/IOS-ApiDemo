//
//  AutoLayoutViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/9/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func dictionaryOfNames(_ arr:UIView...) -> [String:UIView] {
        var d = [String:UIView]()
        for (ix,v) in arr.enumerated() {
            d["v\(ix+1)"] = v
        }
        return d
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        let v1 = UIView(frame: CGRect(x: 100, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView()
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView()
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        
        let d = dictionaryOfNames(v1, v2, v3)
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[v2]|", options: [], metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2(10)]", options: [], metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "H:[v3(20)]|", options: [], metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[v3(20)]|", options: [], metrics: nil, views: d)
            ].joined().map{$0})
        
        delay(2) {
            v1.bounds.size.width += 40
            v1.bounds.size.height -= 50
        }
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
