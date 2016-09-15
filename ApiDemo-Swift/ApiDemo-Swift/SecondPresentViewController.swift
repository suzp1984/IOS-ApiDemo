//
//  SecondPresentViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/25/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

protocol SecondPresentControllerDelegate : class {
    func acceptData(_ data: AnyObject!)
}

class SecondPresentViewController: UIViewController {

    weak var delegate : SecondPresentControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
        
        let button = UIButton(type: .system)
        button.setTitle("dismiss", for: UIControlState())
        button.addTarget(self, action: #selector(SecondPresentViewController.doDismiss(_:)), for: .touchUpInside)
        button.setTitleColor(UIColor.yellow, for: UIControlState())
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        
        let presentButton = UIButton(type: .system)
        presentButton.setTitle("start Third Controller", for: UIControlState())
        presentButton.addTarget(self, action: #selector(SecondPresentViewController.startThird(_:)), for: .touchUpInside)
        presentButton.setTitleColor(UIColor.yellow, for: UIControlState())
        
        self.view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            presentButton.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20)
            ])
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.delegate?.acceptData("Test" as AnyObject!)
    }
    
    func doDismiss(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func startThird(_ sender: UIButton) {
        let third = ThirdPresentViewController()
        self.definesPresentationContext = true
        third.modalPresentationStyle = .currentContext
        third.modalTransitionStyle = .flipHorizontal
        self.present(third, animated: true, completion: nil)
    }

}
