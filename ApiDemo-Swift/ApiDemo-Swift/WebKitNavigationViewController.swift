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

        wk.navigationDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: "https://www.apple.com")
        
        if let wk = self.wk, let url = url {
            wk.load(URLRequest(url: url))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated {
            if let url = navigationAction.request.url {
                UIApplication.shared.openURL(url)
                decisionHandler(.cancel)
                return
            }
        }
        
        decisionHandler(.allow)
    }

}
