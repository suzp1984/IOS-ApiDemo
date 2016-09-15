//
//  ImageTraitCollectionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/12/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageTraitCollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        iv1.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let iv2 = UIImageView()
        iv2.translatesAutoresizingMaskIntoConstraints = false
        iv2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        iv2.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let button = UIButton(type: .system)
        button.setTitle("Button", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let myiv = MyImageView()
        myiv.translatesAutoresizingMaskIntoConstraints = false
        myiv.widthAnchor.constraint(equalToConstant: 120).isActive = true
        myiv.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.view.addSubview(iv1)
        self.view.addSubview(iv2)
        self.view.addSubview(button)
        self.view.addSubview(myiv)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv1]-(>=10)-[button]-(10)-|", options: [], metrics: nil, views: ["iv1":iv1, "button":button]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv2]-(>=10)-[myview]-(10)-|", options: [], metrics: nil, views: ["iv2":iv2, "myview": myiv]),
            // NSLayoutConstraint.constraintsWithVisualFormat("H:[button]-(10)-|", options: [], metrics: nil, views: ["button":button]),
            // NSLayoutConstraint.constraintsWithVisualFormat("H:[myview]-(10)-|", options: [], metrics: nil, views: ["myview": myiv]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-(10)-[iv1]-(10)-[iv2]", options: [], metrics: nil, views: ["tlg":self.topLayoutGuide, "iv1":iv1, "iv2":iv2]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-(10)-[button]-(10)-[myview]", options: [], metrics: nil, views: ["tlg":self.topLayoutGuide, "button":button, "myview":myiv])
            ].flatMap{$0})
        
        // set image
        iv1.image = UIImage(named: "Moods")
        
        let tcdisp = UITraitCollection(displayScale: UIScreen.main.scale)
        let tcphone = UITraitCollection(userInterfaceIdiom: .phone)
        let tcreg = UITraitCollection(verticalSizeClass: .regular)
        let tc1 = UITraitCollection(traitsFrom: [tcdisp, tcphone, tcreg])
        let tccom = UITraitCollection(verticalSizeClass: .compact)
        let tc2 = UITraitCollection(traitsFrom: [tcdisp, tcphone, tccom])
        let moods = UIImageAsset()
        let frowney = UIImage(named:"frowney")!.withRenderingMode(.alwaysOriginal)
        let smiley = UIImage(named:"smiley")!.withRenderingMode(.alwaysOriginal)
        moods.register(frowney, with: tc1)
        moods.register(smiley, with: tc2)
        
        let tc = self.traitCollection
        let im = moods.image(with: tc)

        iv2.image = im
        
        button.setImage(im, for: UIControlState())
        button.setImage(im, for: .highlighted)
        
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
