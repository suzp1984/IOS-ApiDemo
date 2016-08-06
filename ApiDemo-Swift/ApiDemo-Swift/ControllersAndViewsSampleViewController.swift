//
//  ControllersAndViewsSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/29/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ControllersAndViewsSampleViewController: UIViewController, UINavigationControllerDelegate,
                                                UITableViewDelegate, UITableViewDataSource {

    
    let cellIdentifier = "Controllers Views"
    let demos: [String] = ["indicator", "progress bar", "picker view", "search bar", "switcher", "stepper",
                           "page controller"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Controllers & Views"
        let table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.cyanColor()
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.view.addSubview(table)
        self.navigationItem.leftItemsSupplementBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        if cell == nil {
            cell = UITableViewCell(style:.Default, reuseIdentifier:cellIdentifier)
            
            cell.textLabel!.textColor = UIColor.whiteColor()
            
            let v2 = UIView() // no need to set frame
            v2.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.2)
            cell.selectedBackgroundView = v2
            
            // next line didn't work until iOS 7!
            cell.backgroundColor = UIColor.redColor()
        }
        
        let v2 = UIView() // no need to set frame
        v2.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.2)
        cell.selectedBackgroundView = v2
        
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.redColor()
        cell.textLabel!.text = demos[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch demos[indexPath.row] {
        case demos[0]:
            self.navigationController?.pushViewController(IndicatorSampleViewController(), animated: true)
        case demos[1]:
            self.navigationController?.pushViewController(ProgressBarViewController(), animated: true)
        case demos[2]:
            self.navigationController?.pushViewController(UIPickerViewController(), animated: true)
        case demos[3]:
            self.navigationController?.pushViewController(SearchBarViewController(), animated: true)
        case demos[4]:
            self.navigationController?.pushViewController(UISwitchViewController(), animated: true)
        case demos[5]:
            self.navigationController?.pushViewController(StepperViewController(), animated: true)
        case demos[6]:
            self.navigationController?.pushViewController(PageControlViewController(), animated: true)
        default:
            break
        }
    }


}
