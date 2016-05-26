//
//  LayerSampleController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/26/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class LayerSampleController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "Heriarchy layer"
    let demos = ["layer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Layers"
        let table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.cyanColor()
        
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
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style:.Default, reuseIdentifier:cellIdentifier)
            
            cell.textLabel!.textColor = UIColor.whiteColor()
            
            let v2 = UIView() // no need to set frame
            v2.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.2)
            cell.selectedBackgroundView = v2
            // next line no longer necessary in iOS 7!
            // cell.textLabel.backgroundColor = UIColor.clearColor()
            
            // next line didn't work until iOS 7!
            cell.backgroundColor = UIColor.redColor()
        }
        
        cell.textLabel!.text = demos[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch demos[indexPath.row] {
        case demos[0]:
            self.navigationController!.pushViewController(LayerHierarchyViewController(), animated: true)
            break
        default:
            break
        }
    }
}
