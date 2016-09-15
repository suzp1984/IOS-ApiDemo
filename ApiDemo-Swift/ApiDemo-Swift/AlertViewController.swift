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

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        button.setTitle("Alert", for: UIControlState())
        button.addTarget(self, action: #selector(AlertViewController.presentAlert(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        // textfield alert dialog
        let textFieldButton = UIButton(type: .system)
        textFieldButton.setTitle("EnterNumber Alert", for: UIControlState())
        textFieldButton.addTarget(self, action: #selector(AlertViewController.presentTextFieldAlert(_:)), for: .touchUpInside)
        textFieldButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textFieldButton)
        NSLayoutConstraint.activate([
                textFieldButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
                textFieldButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // alert sheet style dialog
        let actionSheetButton = UIButton(type: .system)
        actionSheetButton.setTitle("Action Sheet alert", for: UIControlState())
        actionSheetButton.addTarget(self, action: #selector(AlertViewController.presentActionSheet(_:)), for: .touchUpInside)
        actionSheetButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(actionSheetButton)
        NSLayoutConstraint.activate([
                actionSheetButton.topAnchor.constraint(equalTo: textFieldButton.bottomAnchor, constant: 20),
                actionSheetButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "No so Fast!", message: "Hello world", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: handler))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: handler))
        alert.addAction(UIAlertAction(title: "Maybe", style: .default, handler: handler))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentTextFieldAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enter a Number:", message: nil, preferredStyle: .alert)
        alert.addTextField {
            (tf: UITextField) in
            tf.keyboardType = .numberPad
            tf.addTarget(self, action: #selector(AlertViewController.textChanged(_:)), for: .editingChanged)
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (act: UIAlertAction) in
            let tf: UITextField = alert.textFields![0]
            if let s = tf.text {
                print("Entered number is \(s)")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.actions[0].isEnabled = false
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentActionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choice new Layout", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        for s in ["3", "4", "5", "6"] {
            alert.addAction(UIAlertAction(title: s, style: .default, handler: { (act: UIAlertAction) in
                if let s = act.title {
                    print("Selected action: \(s)")
                }
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }

    func handler(_ act: UIAlertAction) {
        print("User tapped \(act.title)")
    }
    
    func textChanged(_ sender: UITextField) {
        // print("TextField changed: \(sender.text)")
        
        var resp : UIResponder = sender
        while !(resp is UIAlertController) {
            resp = resp.next!
        }
        
        let alert = resp as! UIAlertController
        alert.actions[0].isEnabled = (sender.text != "")
    }
}
