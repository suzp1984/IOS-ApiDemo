//
//  OriginChangedViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/15/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class OriginChangedViewController: UIViewController {

    var v1 : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        self.v1 = v1
        
        let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        
        self.view.addSubview(v1)
        v1.addSubview(v2)
        
        let btn = UIButton(type: .system)
        btn.setTitle("chang origin", for: UIControlState())
        btn.addTarget(self, action: #selector(OriginChangedViewController.changeOrigin(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                btn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeOrigin(_ sender: UIButton) {
        if let v1 = self.v1 {
            v1.bounds.origin.x += 10
            v1.bounds.origin.y += 10
        }
    }

}
