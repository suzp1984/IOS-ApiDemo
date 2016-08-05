//
//  SearchBarViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/5/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UISearchBarDelegate {

    var searchBar : UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.searchBar = UISearchBar()
        self.searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.searchBar)
        
        NSLayoutConstraint.activateConstraints([
                searchBar.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                searchBar.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 50),
                searchBar.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor),
                searchBar.heightAnchor.constraintEqualToConstant(140)
            ])
        
        self.searchBar.enablesReturnKeyAutomatically = true
        self.searchBar.searchBarStyle = .Default
        self.searchBar.translucent = true
        self.searchBar.tintColor = UIColor.greenColor()
        var linim : UIImage? = nil
        
        if let lin = UIImage(named: "linen.png") {
            linim = lin.resizableImageWithCapInsets(UIEdgeInsetsMake(1, 1, 1, 1), resizingMode: .Stretch)
            self.searchBar.setBackgroundImage(linim, forBarPosition: .Any, barMetrics: .Default)
            self.searchBar.setBackgroundImage(linim, forBarPosition: .Any, barMetrics: .DefaultPrompt)
        }
        
        let sepim = imageFromContextOfSize(CGSizeMake(320,20)) {
            UIBezierPath(roundedRect:CGRectMake(5,0,320-5*2,20), cornerRadius:8).addClip()
            UIImage(named:"sepia.jpg")!.drawInRect(CGRectMake(0,0,320,20))
        }
        self.searchBar.setSearchFieldBackgroundImage(sepim, forState:.Normal)
        // just to show what it does:
        self.searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(0, -10) // up from center
     
        // how to reach in and grab the text field
        for v in self.searchBar.subviews[0].subviews {
            if let tf = v as? UITextField {
                print("got that puppy")
                tf.textColor = UIColor.whiteColor()
                // tf.enabled = false
                break
            }
        }

        self.searchBar.text = "Search Me"
        let manny = UIImage(named:"manny.jpg")!
        self.searchBar.setImage(manny, forSearchBarIcon:.Search, state:.Normal)
        let mannyim = imageFromContextOfSize(CGSizeMake(20,20)) {
            manny.drawInRect(CGRectMake(0,0,20,20))
        }
        self.searchBar.setImage(mannyim, forSearchBarIcon:.Clear, state:.Normal)
        
        let moe = UIImage(named:"moe.jpg")!
        let moeim = imageFromContextOfSize(CGSizeMake(20,20)) {
            moe.drawInRect(CGRectMake(0,0,20,20))
        }
        self.searchBar.setImage(moeim, forSearchBarIcon:.Clear, state:.Highlighted)
        
        self.searchBar.showsScopeBar = true
        self.searchBar.scopeButtonTitles = ["Manny", "Moe", "Jack"]
        
        self.searchBar.scopeBarBackgroundImage = UIImage(named:"sepia.jpg")
        
        if let linim = linim {
            self.searchBar.setScopeBarButtonBackgroundImage(linim, forState:.Normal)
        }
        
        let divim = imageFromContextOfSize(CGSizeMake(2,2)) {
            UIColor.whiteColor().setFill()
            UIBezierPath(rect:CGRectMake(0,0,2,2)).fill()
        }
        self.searchBar.setScopeBarButtonDividerImage(divim,
                                              forLeftSegmentState:.Normal, rightSegmentState:.Normal)
        
        let atts = [
            NSFontAttributeName: UIFont(name:"GillSans-Bold", size:16)!,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleDouble.rawValue
        ]
        self.searchBar.setScopeBarButtonTitleTextAttributes(atts, forState:.Normal)
        self.searchBar.setScopeBarButtonTitleTextAttributes(atts, forState:.Selected)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageFromContextOfSize(size:CGSize, closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
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
