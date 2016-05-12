//
//  ImageTraitCollectionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/12/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class ImageTraitCollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.widthAnchor.constraintEqualToConstant(120).active = true
        iv1.heightAnchor.constraintEqualToConstant(120).active = true
        
        let iv2 = UIImageView()
        iv2.translatesAutoresizingMaskIntoConstraints = false
        iv2.widthAnchor.constraintEqualToConstant(120).active = true
        iv2.heightAnchor.constraintEqualToConstant(120).active = true
        
        let button = UIButton(type: .System)
        button.setTitle("Button", forState: UIControlState.Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraintEqualToConstant(50).active = true
        button.heightAnchor.constraintEqualToConstant(50).active = true
        
        let myiv = MyImageView()
        myiv.translatesAutoresizingMaskIntoConstraints = false
        myiv.widthAnchor.constraintEqualToConstant(120).active = true
        myiv.heightAnchor.constraintEqualToConstant(120).active = true
        
        self.view.addSubview(iv1)
        self.view.addSubview(iv2)
        self.view.addSubview(button)
        self.view.addSubview(myiv)
        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv1]-(>=10)-[button]-(10)-|", options: [], metrics: nil, views: ["iv1":iv1, "button":button]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[iv2]-(>=10)-[myview]-(10)-|", options: [], metrics: nil, views: ["iv2":iv2, "myview": myiv]),
            // NSLayoutConstraint.constraintsWithVisualFormat("H:[button]-(10)-|", options: [], metrics: nil, views: ["button":button]),
            // NSLayoutConstraint.constraintsWithVisualFormat("H:[myview]-(10)-|", options: [], metrics: nil, views: ["myview": myiv]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(10)-[iv1]-(10)-[iv2]", options: [], metrics: nil, views: ["tlg":self.topLayoutGuide, "iv1":iv1, "iv2":iv2]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(10)-[button]-(10)-[myview]", options: [], metrics: nil, views: ["tlg":self.topLayoutGuide, "button":button, "myview":myiv])
            ].flatMap{$0})
        
        // set image
        iv1.image = UIImage(named: "Moods")
        
        let tcdisp = UITraitCollection(displayScale: UIScreen.mainScreen().scale)
        let tcphone = UITraitCollection(userInterfaceIdiom: .Phone)
        let tcreg = UITraitCollection(verticalSizeClass: .Regular)
        let tc1 = UITraitCollection(traitsFromCollections: [tcdisp, tcphone, tcreg])
        let tccom = UITraitCollection(verticalSizeClass: .Compact)
        let tc2 = UITraitCollection(traitsFromCollections: [tcdisp, tcphone, tccom])
        let moods = UIImageAsset()
        let frowney = UIImage(named:"frowney")!.imageWithRenderingMode(.AlwaysOriginal)
        let smiley = UIImage(named:"smiley")!.imageWithRenderingMode(.AlwaysOriginal)
        moods.registerImage(frowney, withTraitCollection: tc1)
        moods.registerImage(smiley, withTraitCollection: tc2)
        
        let tc = self.traitCollection
        let im = moods.imageWithTraitCollection(tc)

        iv2.image = im
        
        button.setImage(im, forState: .Normal)
        button.setImage(im, forState: .Highlighted)
        
        myiv.image = im
        
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
