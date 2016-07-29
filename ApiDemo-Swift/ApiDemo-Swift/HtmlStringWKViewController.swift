//
//  HtmlStringWKViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/29/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit
import WebKit

class HtmlStringWKViewController: UIViewController {

    var wk : WKWebView?
    
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

    }

    override func viewDidAppear(animated: Bool) {
        let templatePath = NSBundle.mainBundle().pathForResource("htmlTemplate", ofType: "txt")
        let contentPath = NSBundle.mainBundle().pathForResource("htmlbody", ofType: "txt")
        
        if let templatePath = templatePath, contentPath = contentPath {
            let base = NSURL.fileURLWithPath(templatePath)
            let template = try? String(contentsOfFile: templatePath, encoding: NSUTF8StringEncoding)
            let content = try? String(contentsOfFile: contentPath, encoding: NSUTF8StringEncoding)
            
            if let template = template, content = content {
                let html = template.stringByReplacingOccurrencesOfString("<content>", withString: content)
                self.wk?.loadHTMLString(html, baseURL: base)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
