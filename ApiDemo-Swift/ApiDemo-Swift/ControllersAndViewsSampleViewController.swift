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
                           "page controller", "date picker", "slider", "Segmented View", "Button",
                           "Custome Control", "Slider Bubble", "Bar Shadow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Controllers & Views"
        let table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.cyan
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.view.addSubview(table)
        self.navigationItem.leftItemsSupplementBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if cell == nil {
            cell = UITableViewCell(style:.default, reuseIdentifier:cellIdentifier)
            
            cell.textLabel!.textColor = UIColor.white
            
            let v2 = UIView() // no need to set frame
            v2.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            cell.selectedBackgroundView = v2
            
            // next line didn't work until iOS 7!
            cell.backgroundColor = UIColor.red
        }
        
        let v2 = UIView() // no need to set frame
        v2.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        cell.selectedBackgroundView = v2
        
        cell.textLabel!.textColor = UIColor.white
        cell.backgroundColor = UIColor.red
        cell.textLabel!.text = demos[(indexPath as NSIndexPath).row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch demos[(indexPath as NSIndexPath).row] {
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
        case demos[7]:
            self.navigationController?.pushViewController(DatePickerViewController(), animated: true)
        case demos[8]:
            self.navigationController?.pushViewController(SliderSampleViewController(), animated: true)
        case demos[9]:
            self.navigationController?.pushViewController(SegmentViewController(), animated: true)
        case demos[10]:
            self.navigationController?.pushViewController(ButtonSampleViewController(), animated: true)
        case demos[11]:
            self.navigationController?.pushViewController(CustomControlViewController(), animated: true)
        case demos[12]:
            self.navigationController?.pushViewController(SliderBubbleViewController(), animated: true)
        case demos[13]:
            self.navigationController?.pushViewController(BarShadowViewController(), animated: true)
        default:
            break
        }
    }


}
