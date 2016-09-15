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

        self.view.backgroundColor = UIColor.white
        self.searchBar = UISearchBar()
        self.searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.searchBar)
        
        NSLayoutConstraint.activate([
                searchBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                searchBar.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 50),
                searchBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                searchBar.heightAnchor.constraint(equalToConstant: 140)
            ])
        
        self.searchBar.enablesReturnKeyAutomatically = true
        self.searchBar.searchBarStyle = .default
        self.searchBar.isTranslucent = true
        self.searchBar.tintColor = UIColor.green
        var linim : UIImage? = nil
        
        if let lin = UIImage(named: "linen.png") {
            linim = lin.resizableImage(withCapInsets: UIEdgeInsetsMake(1, 1, 1, 1), resizingMode: .stretch)
            self.searchBar.setBackgroundImage(linim, for: .any, barMetrics: .default)
            self.searchBar.setBackgroundImage(linim, for: .any, barMetrics: .defaultPrompt)
        }
        
        let sepim = imageFromContextOfSize(CGSize(width: 320,height: 20)) {
            UIBezierPath(roundedRect:CGRect(x: 5,y: 0,width: 320-5*2,height: 20), cornerRadius:8).addClip()
            UIImage(named:"sepia.jpg")!.draw(in: CGRect(x: 0,y: 0,width: 320,height: 20))
        }
        self.searchBar.setSearchFieldBackgroundImage(sepim, for:UIControlState())
        // just to show what it does:
        self.searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(0, -10) // up from center
     
        // how to reach in and grab the text field
        for v in self.searchBar.subviews[0].subviews {
            if let tf = v as? UITextField {
                print("got that puppy")
                tf.textColor = UIColor.white
                // tf.enabled = false
                break
            }
        }

        self.searchBar.text = "Search Me"
        let manny = UIImage(named:"manny.jpg")!
        self.searchBar.setImage(manny, for:.search, state:UIControlState())
        let mannyim = imageFromContextOfSize(CGSize(width: 20,height: 20)) {
            manny.draw(in: CGRect(x: 0,y: 0,width: 20,height: 20))
        }
        self.searchBar.setImage(mannyim, for:.clear, state:UIControlState())
        
        let moe = UIImage(named:"moe.jpg")!
        let moeim = imageFromContextOfSize(CGSize(width: 20,height: 20)) {
            moe.draw(in: CGRect(x: 0,y: 0,width: 20,height: 20))
        }
        self.searchBar.setImage(moeim, for:.clear, state:.highlighted)
        
        self.searchBar.showsScopeBar = true
        self.searchBar.scopeButtonTitles = ["Manny", "Moe", "Jack"]
        
        self.searchBar.scopeBarBackgroundImage = UIImage(named:"sepia.jpg")
        
        if let linim = linim {
            self.searchBar.setScopeBarButtonBackgroundImage(linim, for:UIControlState())
        }
        
        let divim = imageFromContextOfSize(CGSize(width: 2,height: 2)) {
            UIColor.white.setFill()
            UIBezierPath(rect:CGRect(x: 0,y: 0,width: 2,height: 2)).fill()
        }
        self.searchBar.setScopeBarButtonDividerImage(divim,
                                              forLeftSegmentState:UIControlState(), rightSegmentState:UIControlState())
        
        let atts = [
            NSFontAttributeName: UIFont(name:"GillSans-Bold", size:16)!,
            NSForegroundColorAttributeName: UIColor.white,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue
        ] as [String : Any]
        self.searchBar.setScopeBarButtonTitleTextAttributes(atts, for:UIControlState())
        self.searchBar.setScopeBarButtonTitleTextAttributes(atts, for:.selected)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func imageFromContextOfSize(_ size:CGSize, closure:() -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
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
