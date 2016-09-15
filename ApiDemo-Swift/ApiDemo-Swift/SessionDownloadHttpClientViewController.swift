//
//  SessionDownloadHttpClientViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/2/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SessionDownloadHttpClientViewController: UIViewController, URLSessionDownloadDelegate {

    var iv : UIImageView?
    var task : URLSessionTask?
    
    lazy var session : Foundation.URLSession = {
        let config = URLSessionConfiguration.ephemeral
        config.allowsCellularAccess = false
        let session = Foundation.URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        return session
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv)
        NSLayoutConstraint.activate([
            iv.widthAnchor.constraint(equalToConstant: 269),
            iv.heightAnchor.constraint(equalToConstant: 186),
            iv.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
            iv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        self.iv = iv
        
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btn)
        btn.setTitle("Session Download Delegate", for: UIControlState())
        btn.addTarget(self, action: #selector(SimpleHttpClientViewController.downloadImg(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: iv.bottomAnchor, constant: 20),
            btn.centerXAnchor.constraint(equalTo: iv.centerXAnchor)
            ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadImg(_ sender: UIButton) {
        if self.task != nil {
            return
        }
        
        let s = "https://www.apeth.net/matt/images/phoenixnewest.jpg"
        if let url = URL(string: s) {
            let req = NSMutableURLRequest(url: url)
            URLProtocol.setProperty("howdy", forKey: "greeting", in: req)
            self.task = self.session.downloadTask(with: req)
            self.task?.resume()
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten writ: Int64, totalBytesExpectedToWrite exp: Int64) {
        print("downloaded \(100*writ/exp)%")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        // unused in this example
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("completed: error: \(error)")
        self.task = nil
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        let req = downloadTask.originalRequest!
        if let greeting = URLProtocol.property(forKey: "greeting", in:req) as? String {
            print(greeting)
        }
        
        self.task = nil
        let response = downloadTask.response as! HTTPURLResponse
        let stat = response.statusCode
        print("status \(stat)")
        if stat != 200 {
            return
        }
        
        let d = try! Data(contentsOf: location)
        let im = UIImage(data:d)
        DispatchQueue.main.async {
            if let iv = self.iv {
                iv.image = im
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.session.finishTasksAndInvalidate()
        self.task = nil
    }

    deinit {
        print("farewell")
    }

}
