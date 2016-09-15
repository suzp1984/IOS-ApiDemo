//
//  StarsViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/8/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let star = StarsView()
        star.frame = self.view.bounds
        star.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(star)
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
