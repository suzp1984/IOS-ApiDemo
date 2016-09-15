//
//  PresentControllerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/25/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PresentControllerViewController: UIViewController, SecondPresentControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        button.setTitle("Present", for: UIControlState())
        button.addTarget(self, action: #selector(PresentControllerViewController.doPresent(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doPresent(_ sender: UIButton) -> Void {
        let svc = SecondPresentViewController()
        svc.delegate = self
        // svc.modalTransitionStyle = .PartialCurl
        self.definesPresentationContext = true
        svc.modalPresentationStyle = .currentContext
        self.present(svc, animated: true, completion: nil)
    }
    
    func acceptData(_ data: AnyObject!) {
        // do nothing
        
        // self.dismissViewControllerAnimated(true, completion: nil)
    }
}
