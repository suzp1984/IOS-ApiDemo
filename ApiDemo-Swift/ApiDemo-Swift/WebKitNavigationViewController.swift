//
//  WebKitNavigationViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/29/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit
import WebKit

class WebKitNavigationViewController: UIViewController, WKNavigationDelegate {

    var wk : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

        wk.navigationDelegate = self
    }

    override func viewDidAppear(animated: Bool) {
        let url = NSURL(string: "https://www.apple.com")
        
        if let wk = self.wk, url = url {
            wk.loadRequest(NSURLRequest(URL: url))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .LinkActivated {
            if let url = navigationAction.request.URL {
                UIApplication.sharedApplication().openURL(url)
                decisionHandler(.Cancel)
                return
            }
        }
        
        decisionHandler(.Allow)
    }

}
