//
//  UIPickerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/5/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class UIPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var picker : UIPickerView?
    var states : [String]?
    var selectedLabel : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.yellow
        self.view.addSubview(picker)
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                picker.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        let selected = UILabel()
        selected.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(selected)
        NSLayoutConstraint.activate([
                selected.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: -20),
                selected.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        self.selectedLabel = selected
        
        if let f = Bundle.main.path(forResource: "usa-states", ofType: "txt") {
            let s = try! String(contentsOfFile: f, encoding: String.Encoding.utf8)
            self.states = s.components(separatedBy: "\n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let states = self.states {
            return states.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let lab : UILabel
        if let label = view as? UILabel {
            lab = label
            print("reusing Label")
        } else {
            lab = MyLabel()
            print("making new Label")
        }
        
        if let states = self.states {
            lab.text = states[row]
        }
        
        lab.backgroundColor = UIColor.clear
        lab.sizeToFit()
        return lab
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let selectedLabel = self.selectedLabel, let states = self.states {
            selectedLabel.text = states[row]
        }
    }
}

class MyLabel : UILabel {
    deinit {
        print("my label farewell")
    }
}

class MyPickerView: UIPickerView {
    override var intrinsicContentSize : CGSize {
        var sz = super.intrinsicContentSize
        let h : CGFloat = 140
        sz.height = h
        return sz
    }
}
