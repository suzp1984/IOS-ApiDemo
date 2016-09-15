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
        let wk = WKWebView(frame: CGRect.zero)
        self.wk = wk
        
        wk.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(wk)
        
        NSLayoutConstraint.activate([
            wk.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
            wk.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor),
            wk.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            wk.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            ])

        // activity indicator
        let act = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        act.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        self.activity = act
        wk.addSubview(act)
        act.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                act.centerXAnchor.constraint(equalTo: wk.centerXAnchor),
                act.centerYAnchor.constraint(equalTo: wk.centerYAnchor)
            ])
        
        wk.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: "https://www.apple.com")
        
        if let wk = self.wk, let url = url {
            wk.load(URLRequest(url: url))
        }
        
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
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
            if let val = change[NSKeyValueChangeKey.newKey] as? Bool {
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
