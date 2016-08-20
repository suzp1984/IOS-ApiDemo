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
    let demos = ["ImageView Resolution", "Image TraitCollection", "ImageView ContentMode", "Image Resizable", "Graphic Context",
                 "Image Drawing", "Snapshot", "Image Filter 1", "Image Filter 2", "Visual Effect", "Custom Drawing 1",
                 "Custom Drawing 2", "Custom Drawing 3", "Custom Drawing 4", "Custom Drawing 5", "Custom Drawing 6",
                 "Custom Drawing 7", "Custome Drawing 8", "Custom Drawing 9", "Clear Rect", "Image RenderMode"]
    
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
        case demos[5]:
            self.navigationController!.pushViewController(ImageDrawingViewController(), animated: true)
            break
        case demos[6]:
            self.navigationController!.pushViewController(SnapshotViewController(), animated: true)
            break
        case demos[7]:
            self.navigationController!.pushViewController(ImageFilter1ViewController(), animated: true)
            break
        case demos[8]:
            self.navigationController!.pushViewController(ImageFilter2ViewController(), animated: true)
            break
        case demos[9]:
            self.navigationController!.pushViewController(VisualEffectViewController(), animated: true)
            break
        case demos[10]:
            let c = CustomeDrawingViewController()
            c.whitch = 1
            self.navigationController!.pushViewController(c, animated: true)
            break
        case demos[11]:
            let c = CustomeDrawingViewController()
            c.whitch = 2
            self.navigationController!.pushViewController(c, animated: true)
            break
        case demos[12]:
            let c = CustomeDrawingViewController()
            c.whitch = 3
            self.navigationController!.pushViewController(c, animated: true)
            break
        case demos[13]:
            let c = CustomeDrawingViewController()
            c.whitch = 4
            self.navigationController!.pushViewController(c, animated: true)
            break
        case demos[14]:
            let c = CustomeDrawingViewController()
            c.whitch = 5
            self.navigationController!.pushViewController(c, animated: true)
            break
        case demos[15]:
            let c = CustomeDrawingViewController()
            c.whitch = 6
            self.navigationController!.pushViewController(c, animated: true)
            break
        case demos[16]:
            let c = CustomeDrawingViewController()
            c.whitch = 7
            self.navigationController!.pushViewController(c, animated: true)
            break
        case demos[17]:
            let c = CustomeDrawingViewController()
            c.whitch = 8
            self.navigationController!.pushViewController(c, animated: true)
        case demos[18]:
            let c = CustomeDrawingViewController()
            c.whitch = 9
            self.navigationController!.pushViewController(c, animated: true)
        case demos[19]:
            let c = CustomeDrawingViewController()
            c.whitch = 10
            self.navigationController!.pushViewController(c, animated: true)
        case demos[20]:
            self.navigationController?.pushViewController(ImageRenderModeViewController(), animated: true)
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
