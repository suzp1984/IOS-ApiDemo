//
//  MainViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/2/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "ApiDemo"
        let tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.cyanColor()
        
        self.view.addSubview(tableView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnSwipe = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let cellIdentifier = "Cell"
    let demos = ["view", "drawing", "layers", "animation", "touches", "view controllers",
                 "Scroll Views", "Table Views", "Text", "Web Views", "Controllers and Views",
                 "Modal Dialogs", "Audio", "Video", "Persistent Storage", "Network", "Threads"]
    
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
        //CODE TO BE RUN ON CELL TOUCH
        switch demos[indexPath.row] {
        case demos[0]:
            self.navigationController!.pushViewController(ViewSampleController(), animated: true)
        case demos[1]:
            self.navigationController!.pushViewController(DrawingSampleController(), animated: true)
        case demos[2]:
            self.navigationController!.pushViewController(LayerSampleController(), animated: true)
        case demos[3]:
            self.navigationController!.pushViewController(AnimationSampleController(), animated: true)
        case demos[4]:
            self.navigationController!.pushViewController(TouchesSampleController(), animated: true)
        case demos[5]:
            self.navigationController!.pushViewController(ViewControllersSampleController(), animated: true)
        case demos[6]:
            self.navigationController!.pushViewController(ScrollSamplesViewController(), animated: true)
        case demos[7]:
            self.navigationController?.pushViewController(TableSampleViewController(), animated: true)
        case demos[8]:
            self.navigationController?.pushViewController(TextSampleViewController(), animated: true)
        case demos[9]:
            self.navigationController?.pushViewController(WebViewSamplesController(), animated: true)
        case demos[10]:
            self.navigationController?.pushViewController(ControllersAndViewsSampleViewController(), animated: true)
        case demos[11]:
            self.navigationController?.pushViewController(ModalDialogSampleViewController(), animated: true)
        case demos[12]:
            self.navigationController?.pushViewController(AudioSamplesViewController(), animated: true)
        case demos[13]:
            self.navigationController?.pushViewController(VideoSamplesViewController(), animated: true)
        case demos[14]:
            self.navigationController?.pushViewController(PersistentStorageSamplesViewController(), animated: true)
        case demos[15]:
            self.navigationController?.pushViewController(NetworkSamplesViewController(), animated: true)
        case demos[16]:
            self.navigationController?.pushViewController(ThreadsSampleViewController(), animated: true)
        default:
            break
        }
    }
}
