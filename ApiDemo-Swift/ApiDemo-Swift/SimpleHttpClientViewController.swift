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
        btn.setTitle("Download Img", for: UIControlState())
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
        let s = "https://www.apeth.net/matt/images/phoenixnewest.jpg"
        let session = URLSession.shared
        if let url = URL(string: s) {
            let task = session.downloadTask(with: url, completionHandler: {
                (loc:URL?, response:URLResponse?, error:NSError?) in
                if error != nil {
                    print(error)
                    return
                }
                
                let status = (response as! HTTPURLResponse).statusCode
                print("response status: \(status)")
                if status != 200 {
                    print("oh well")
                    return
                }
                let d = try! Data(contentsOf: loc!)
                let im = UIImage(data:d)
                DispatchQueue.main.async {
                    self.iv!.image = im
                    print("done")
                }

                
            } as! (URL?, URLResponse?, Error?) -> Void) 
            
            task.resume()
        }
    }

}
