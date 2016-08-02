//
//  SessionDownloadHttpClientViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/2/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SessionDownloadHttpClientViewController: UIViewController, NSURLSessionDownloadDelegate {

    var iv : UIImageView?
    var task : NSURLSessionTask?
    
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
        btn.setTitle("Session Download Delegate", forState: .Normal)
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
            self.task = self.session.downloadTaskWithRequest(req)
            self.task?.resume()
        }
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten writ: Int64, totalBytesExpectedToWrite exp: Int64) {
        print("downloaded \(100*writ/exp)%")
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        // unused in this example
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        print("completed: error: \(error)")
        self.task = nil
    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        
        let req = downloadTask.originalRequest!
        if let greeting = NSURLProtocol.propertyForKey("greeting", inRequest:req) as? String {
            print(greeting)
        }
        
        self.task = nil
        let response = downloadTask.response as! NSHTTPURLResponse
        let stat = response.statusCode
        print("status \(stat)")
        if stat != 200 {
            return
        }
        
        let d = NSData(contentsOfURL:location)!
        let im = UIImage(data:d)
        dispatch_async(dispatch_get_main_queue()) {
            if let iv = self.iv {
                iv.image = im
            }
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
