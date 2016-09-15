//
//  ViewSampleController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/3/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class ViewSampleController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "view"
    let demos = ["view", "transform", "autoresizing", "autolayout", "ConstraintSwap", "LayoutMargin", "StackView", "origin change"]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "View Samples"
        let tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.cyan
        
        self.view.addSubview(tableView)
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
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style:.default, reuseIdentifier:cellIdentifier)
            
            cell.textLabel!.textColor = UIColor.white
            
            let v2 = UIView() // no need to set frame
            v2.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            cell.selectedBackgroundView = v2
            // next line no longer necessary in iOS 7!
            // cell.textLabel.backgroundColor = UIColor.clearColor()
            
            // next line didn't work until iOS 7!
            cell.backgroundColor = UIColor.red
        }
        
        cell.textLabel!.text = demos[(indexPath as NSIndexPath).row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        switch demos[(indexPath as NSIndexPath).row] {
        case demos[0]:
            self.navigationController!.pushViewController(FrameViewController(), animated: true)
        case demos[1]:
            self.navigationController!.pushViewController(TransformViewController(), animated: true)
        case demos[2]:
            self.navigationController!.pushViewController(ResizingViewController(), animated: true)
        case demos[3]:
            self.navigationController!.pushViewController(AutoLayoutViewController(), animated: true)
        case demos[4]:
            self.navigationController!.pushViewController(ConstraintSwapViewController(), animated: true)
        case demos[5]:
            self.navigationController!.pushViewController(LayoutMarginViewController(), animated: true)
        case demos[6]:
            self.navigationController!.pushViewController(StackViewController(), animated: true)
        case demos[7]:
            self.navigationController?.pushViewController(OriginChangedViewController(), animated: true)
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
