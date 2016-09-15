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
    let demos = ["layer heriarchy", "Drawing into Layers", "Compass", "layer mask", "layer mask2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Layers"
        let table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.cyan
        
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
        switch demos[(indexPath as NSIndexPath).row] {
        case demos[0]:
            self.navigationController!.pushViewController(LayerHierarchyViewController(), animated: true)
        case demos[1]:
            self.navigationController!.pushViewController(DrawingIntoLayerViewController(), animated: true)
        case demos[2]:
            self.navigationController!.pushViewController(CompassViewController(), animated: true)
        case demos[3]:
            self.navigationController!.pushViewController(LayerMaskViewController(), animated: true)
        case demos[4]:
            self.navigationController!.pushViewController(Layermask2ViewController(), animated: true)
        default:
            break
        }
    }
}
