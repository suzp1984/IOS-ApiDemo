//
//  TouchesSampleController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/23/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class TouchesSampleController: UIViewController, UINavigationControllerDelegate,
                                UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "Touches"
    let demos: [String] = ["Touch Events", "Tap Gesture Recognizer", "Custom PanGesture", "Pinch Gesture Recognizer",
                           "Rotation Gesture", "Swipe Gesture", "screen Edge dragging",
                           "Long Press Gesture"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Touches"
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
            self.navigationController?.pushViewController(TouchesViewController(), animated: true)
        case demos[1]:
            self.navigationController?.pushViewController(GestureRecognizerViewController(), animated: true)
        case demos[2]:
            self.navigationController?.pushViewController(HorizVertPanGestureViewController(), animated: true)
        case demos[3]:
            self.navigationController?.pushViewController(PinchGestureRecognizerViewController(), animated: true)
        case demos[4]:
            self.navigationController?.pushViewController(RotationGestureRecognizerViewController(), animated: true)
        case demos[5]:
            self.navigationController?.pushViewController(SwipeGestureRecognizerViewController(), animated: true)
        case demos[6]:
            self.navigationController?.pushViewController(ScreenEdgePanGestureViewController(), animated: true)
        case demos[7]:
            self.navigationController?.pushViewController(LongPressGestureViewController(), animated: true)
        default:
            break
        }
    }
}
