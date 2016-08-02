//
//  SessionDataHttpClientViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/2/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SessionDataHttpClientViewController: UIViewController, NSURLSessionDataDelegate {

    
    var iv : UIImageView?
    var task : NSURLSessionTask?
    var data = NSMutableData()
    
    lazy var session : NSURLSession = {
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        config.allowsCellularAccess = false
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        return session
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        btn.setTitle("Session Data Delegate", forState: .Normal)
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
        if self.task != nil {
            return
        }
        
        let s = "https://www.apeth.net/matt/images/phoenixnewest.jpg"
        if let url = NSURL(string: s) {
            let req = NSMutableURLRequest(URL: url)
            NSURLProtocol.setProperty("howdy", forKey: "greeting", inRequest: req)
            self.task = self.session.dataTaskWithRequest(req)
            self.data.length = 0
            self.task?.resume()
        }
    }

    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        print("received \(data.length) bytes of data")
        // do something with the data here!
        self.data.appendData(data)
    }
    
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        print("completed: error: \(error)")
        self.task = nil
        if error == nil, let iv = self.iv {
            iv.image = UIImage(data:self.data)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.session.finishTasksAndInvalidate()
        self.task = nil
    }
    
    deinit {
        print("farewell")
    }

}
