//
//  AlertViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: .System)
        button.setTitle("Alert", forState: .Normal)
        button.addTarget(self, action: #selector(AlertViewController.presentAlert(_:)), forControlEvents: .TouchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        NSLayoutConstraint.activateConstraints([
                button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                button.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        let textFieldButton = UIButton(type: .System)
        textFieldButton.setTitle("EnterNumber Alert", forState: .Normal)
        textFieldButton.addTarget(self, action: #selector(AlertViewController.presentTextFieldAlert(_:)), forControlEvents: .TouchUpInside)
        textFieldButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textFieldButton)
        NSLayoutConstraint.activateConstraints([
                textFieldButton.topAnchor.constraintEqualToAnchor(button.bottomAnchor, constant: 20),
                textFieldButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentAlert(sender: UIButton) {
        let alert = UIAlertController(title: "No so Fast!", message: "Hello world", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: handler))
        alert.addAction(UIAlertAction(title: "Yes", style: .Destructive, handler: handler))
        alert.addAction(UIAlertAction(title: "Maybe", style: .Default, handler: handler))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func presentTextFieldAlert(sender: UIButton) {
        let alert = UIAlertController(title: "Enter a Number:", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler {
            (tf: UITextField) in
            tf.keyboardType = .NumberPad
            tf.addTarget(self, action: #selector(AlertViewController.textChanged(_:)), forControlEvents: .EditingChanged)
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (act: UIAlertAction) in
            let tf: UITextField = alert.textFields![0]
            if let s = tf.text {
                print("Entered number is \(s)")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alert.actions[0].enabled = false
        self.presentViewController(alert, animated: true, completion: nil)
    }

    func handler(act: UIAlertAction) {
        print("User tapped \(act.title)")
    }
    
    func textChanged(sender: UITextField) {
        // print("TextField changed: \(sender.text)")
        
        var resp : UIResponder = sender
        while !(resp is UIAlertController) {
            resp = resp.nextResponder()!
        }
        
        let alert = resp as! UIAlertController
        alert.actions[0].enabled = (sender.text != "")
    }
}
