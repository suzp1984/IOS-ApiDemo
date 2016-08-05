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

        self.view.backgroundColor = UIColor.whiteColor()
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(picker)
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                picker.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor)
            ])
        
        let selected = UILabel()
        selected.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(selected)
        NSLayoutConstraint.activateConstraints([
                selected.bottomAnchor.constraintEqualToAnchor(picker.topAnchor, constant: -20),
                selected.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        
        self.selectedLabel = selected
        
        if let f = NSBundle.mainBundle().pathForResource("usa-states", ofType: "txt") {
            let s = try! String(contentsOfFile: f, encoding: NSUTF8StringEncoding)
            self.states = s.componentsSeparatedByString("\n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let states = self.states {
            return states.count
        }
        
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
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
        
        lab.backgroundColor = UIColor.clearColor()
        lab.sizeToFit()
        return lab
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let selectedLabel = self.selectedLabel, states = self.states {
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
    override func intrinsicContentSize() -> CGSize {
        var sz = super.intrinsicContentSize()
        let h : CGFloat = 140
        sz.height = h
        return sz
    }
}