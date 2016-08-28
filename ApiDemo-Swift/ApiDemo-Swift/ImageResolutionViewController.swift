//
//  ImageResolutionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/11/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageResolutionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.widthAnchor.constraintEqualToConstant(122).active = true
        iv1.heightAnchor.constraintEqualToConstant(122).active = true
        
        let iv2 = UIImageView()
        iv2.translatesAutoresizingMaskIntoConstraints = false
        iv2.widthAnchor.constraintEqualToConstant(122).active = true
        iv2.heightAnchor.constraintEqualToConstant(122).active = true
        
        let iv3 = UIImageView()
        iv3.translatesAutoresizingMaskIntoConstraints = false
        iv3.widthAnchor.constraintEqualToConstant(122).active = true
        iv3.heightAnchor.constraintEqualToConstant(122).active = true
        
        let iv4 = UIImageView()
        iv4.translatesAutoresizingMaskIntoConstraints = false
        iv4.widthAnchor.constraintEqualToConstant(122).active = true
        iv4.heightAnchor.constraintEqualToConstant(122).active = true
        
        self.view.addSubview(iv1)
        self.view.addSubview(iv2)
        self.view.addSubview(iv3)
        self.view.addSubview(iv4)
        
        iv1.image = UIImage(named: "one")
        iv2.image = UIImage(named: "uno")
        if let s = NSBundle.mainBundle().pathForResource("one", ofType: "png") {
            iv3.image = UIImage(contentsOfFile: s)
        }
        if let s2 = NSBundle.mainBundle().pathForResource("uno", ofType: "png") {
            iv4.image = UIImage(contentsOfFile: s2)
        } else {
            print("looking for smiley")
            iv4.image = UIImage(named:"smiley")
        }

        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv1]-(10)-[iv2]", options: [], metrics: nil, views: ["iv1":iv1, "iv2":iv2]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv3]-(10)-[iv4]", options: [], metrics: nil, views: ["iv3":iv3, "iv4":iv4]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(10)-[iv1]-(10)-[iv3]", options: [], metrics: nil, views: ["iv1":iv1, "iv3":iv3, "tlg":self.topLayoutGuide]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(10)-[iv2]-(10)-[iv4]", options: [], metrics: nil, views: ["iv2":iv2, "iv4":iv4, "tlg": self.topLayoutGuide])
            ].flatMap{$0})
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
