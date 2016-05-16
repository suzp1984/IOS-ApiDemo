//
//  DrawingSampleController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/10/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class DrawingSampleController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "drawing"
    let demos = ["ImageView Resolution", "Image TraitCollection", "ImageView ContentMode", "Image Resizable", "Graphic Context"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Drawing Samples"
        let tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.cyanColor()
        
        self.view.addSubview(tableView)
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
            self.navigationController!.pushViewController(ImageResolutionViewController(), animated: true)
            break
        case demos[1]:
            self.navigationController!.pushViewController(ImageTraitCollectionViewController(), animated: true)
            break
        case demos[2]:
            self.navigationController!.pushViewController(ImageViewContentModeViewController(), animated: true)
            break
        case demos[3]:
            self.navigationController!.pushViewController(ImageResizableViewController(), animated: true)
            break
        case demos[4]:
            self.navigationController!.pushViewController(GraphicContextViewController(), animated: true)
            break
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
