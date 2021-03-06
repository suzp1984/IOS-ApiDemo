//
//  ImageResizableViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/13/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageResizableViewController: UIViewController {

    var insets = [UIEdgeInsets]()
    var i : Int = 0
    var mars : UIImage!
    var marsTiled : UIImage!
    var iv : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.iv = UIImageView()
        self.view.addSubview(iv)
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 120).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 240).isActive = true
        iv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        iv.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.mars = UIImage(named: "Mars")!
    
        self.marsTiled = mars!.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .tile)
        
        iv.image = marsTiled
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        button.setTitle("Tile CapInsets", for: UIControlState())
        button.addTarget(self, action: #selector(ImageResizableViewController.changeCapInsets), for: .touchUpInside)
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 40).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        self.insets = [UIEdgeInsets.zero,
                       UIEdgeInsetsMake(
                        mars!.size.height / 4.0,
                        mars!.size.width / 4.0,
                        mars!.size.height / 4.0,
                        mars!.size.width / 4.0
                        ),
                       UIEdgeInsetsMake(
                        mars.size.height / 4.0,
                        mars.size.width / 4.0,
                        mars.size.height / 4.0,
                        mars.size.width / 4.0
                        ),
                       UIEdgeInsetsMake(
                        mars.size.height / 2.0 - 1,
                        mars.size.width / 2.0 - 1,
                        mars.size.height / 2.0 - 1,
                        mars.size.width / 2.0 - 1
            )]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeCapInsets() {
        print("change CapInsets")
        i += 1;
        i = i % insets.count
        self.marsTiled = mars.resizableImage(withCapInsets: insets[i], resizingMode: i < 2 ? .tile : .stretch)
        self.iv.image = self.marsTiled
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
