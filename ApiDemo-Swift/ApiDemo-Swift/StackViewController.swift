//
//  StackViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/10/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.red
        v1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.green
        v2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.yellow
        v3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v3.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        stackView.addArrangedSubview(v1)
        stackView.addArrangedSubview(v2)
        stackView.addArrangedSubview(v3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
