//
//  SimpleHttpClientViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/2/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SimpleHttpClientViewController: UIViewController {

    var iv: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv)
        NSLayoutConstraint.activateConstraints([
                iv.widthAnchor.constraintEqualToConstant(269),
                iv.heightAnchor.constraintEqualToConstant(186),
                iv.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                iv.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        
        self.iv = iv
        
        let btn = UIButton(type: .System)
        btn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btn)
        btn.setTitle("Download Img", forState: .Normal)
        btn.addTarget(self, action: #selector(SimpleHttpClientViewController.downloadImg(_:)), forControlEvents: .TouchUpInside)
        NSLayoutConstraint.activateConstraints([
            btn.topAnchor.constraintEqualToAnchor(iv.bottomAnchor, constant: 20),
            btn.centerXAnchor.constraintEqualToAnchor(iv.centerXAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func downloadImg(sender: UIButton) {
        let s = "https://www.apeth.net/matt/images/phoenixnewest.jpg"
        let session = NSURLSession.sharedSession()
        if let url = NSURL(string: s) {
            let task = session.downloadTaskWithURL(url) {
                (loc:NSURL?, response:NSURLResponse?, error:NSError?) in
                if error != nil {
                    print(error)
                    return
                }
                
                let status = (response as! NSHTTPURLResponse).statusCode
                print("response status: \(status)")
                if status != 200 {
                    print("oh well")
                    return
                }
                let d = NSData(contentsOfURL:loc!)!
                let im = UIImage(data:d)
                dispatch_async(dispatch_get_main_queue()) {
                    self.iv!.image = im
                    print("done")
                }

                
            }
            
            task.resume()
        }
    }

}
