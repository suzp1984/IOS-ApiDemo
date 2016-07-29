//
//  TrackingChangeWebkitViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/29/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit
import WebKit

class TrackingChangeWebkitViewController: UIViewController {

    var wk : WKWebView?
    var activity : UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let wk = WKWebView(frame: CGRectZero)
        self.wk = wk
        
        wk.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(wk)
        
        NSLayoutConstraint.activateConstraints([
            wk.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor),
            wk.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor),
            wk.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor),
            wk.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor)
            ])

        // activity indicator
        let act = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        act.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        self.activity = act
        wk.addSubview(act)
        act.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                act.centerXAnchor.constraintEqualToAnchor(wk.centerXAnchor),
                act.centerYAnchor.constraintEqualToAnchor(wk.centerYAnchor)
            ])
        
        wk.addObserver(self, forKeyPath: "loading", options: .New, context: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        let url = NSURL(string: "https://www.apple.com")
        
        if let wk = self.wk, url = url {
            wk.loadRequest(NSURLRequest(URL: url))
        }
        
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
//        guard let wv = object as? WKWebView else {
//            return
//        }
        
        guard let keyPath = keyPath else {
            return
        }
        
        guard let change = change else {
            return
        }
        
        switch keyPath {
        case "loading":
            if let val = change[NSKeyValueChangeNewKey] as? Bool {
                if val {
                    self.activity?.startAnimating()
                } else {
                    self.activity?.stopAnimating()
                }
            }
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        self.wk?.removeObserver(self, forKeyPath: "loading")
        self.wk?.stopLoading()
    }

}
