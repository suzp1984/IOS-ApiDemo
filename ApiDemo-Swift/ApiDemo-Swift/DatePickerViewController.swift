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
        self.view.backgroundColor = UIColor.white
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        
        self.view.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                datePicker.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor)
            ])
        
        datePicker.addTarget(self, action: #selector(DatePickerViewController.pickDate(_:)), for: .valueChanged)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        self.lable = label
        
        NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickDate(_ sender: UIDatePicker) {
        let df = DateFormatter()
        df.timeStyle = .full
        df.dateStyle = .full
        
        self.lable.text = df.string(from: sender.date)
        self.lable.sizeToFit()
    }
}
