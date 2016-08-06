//
//  DatePickerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    var lable : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .DateAndTime
        
        self.view.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                datePicker.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor)
            ])
        
        datePicker.addTarget(self, action: #selector(DatePickerViewController.pickDate(_:)), forControlEvents: .ValueChanged)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        self.lable = label
        
        NSLayoutConstraint.activateConstraints([
                label.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                label.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickDate(sender: UIDatePicker) {
        let df = NSDateFormatter()
        df.timeStyle = .FullStyle
        df.dateStyle = .FullStyle
        
        self.lable.text = df.stringFromDate(sender.date)
        self.lable.sizeToFit()
    }
}
