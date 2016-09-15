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

    }

    override func viewDidAppear(_ animated: Bool) {
        let templatePath = Bundle.main.path(forResource: "htmlTemplate", ofType: "txt")
        let contentPath = Bundle.main.path(forResource: "htmlbody", ofType: "txt")
        
        if let templatePath = templatePath, let contentPath = contentPath {
            let base = URL(fileURLWithPath: templatePath)
            let template = try? String(contentsOfFile: templatePath, encoding: String.Encoding.utf8)
            let content = try? String(contentsOfFile: contentPath, encoding: String.Encoding.utf8)
            
            if let template = template, let content = content {
                let html = template.replacingOccurrences(of: "<content>", with: content)
                self.wk?.loadHTMLString(html, baseURL: base)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
