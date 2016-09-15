//
//  AnimationSampleController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 6/27/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class AnimationSampleController: UIViewController, UINavigationControllerDelegate,
                                    UITableViewDelegate, UITableViewDataSource {

    
    let cellIdentifier = "animation"
    let demos = ["ImageView Animation", "UIView Animation", "UIView Animation 2", "UIView Transition", "Layer Animation", "Grouped Animation", "Frozen Animation", "Layer Transition", "Actions",
                 "Emitter Layer", "CIFilter Transition", "Dynamics View", "Custome Dynamics Behavior",
                 "AutoLayout Animation"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Animation"
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
            self.navigationController!.pushViewController(ImageViewAnimationViewController(), animated: true)
        case demos[1]:
            self.navigationController!.pushViewController(UIViewAnimationViewController(), animated: true)
        case demos[2]:
            self.navigationController!.pushViewController(UIViewAnimation2ViewController(), animated: true)
        case demos[3]:
            self.navigationController!.pushViewController(UIViewTransitionViewController(), animated: true)
        case demos[4]:
            self.navigationController!.pushViewController(LayerAnimationViewController(), animated: true)
        case demos[5]:
            self.navigationController!.pushViewController(GroupedAnimationViewController(), animated: true)
        case demos[6]:
            self.navigationController!.pushViewController(FrozenAnimationViewController(), animated: true)
        case demos[7]:
            self.navigationController!.pushViewController(LayerTransitionViewController(), animated: true)
        case demos[8]:
            self.navigationController!.pushViewController(ActionsViewController(), animated: true)
        case demos[9]:
            self.navigationController!.pushViewController(EmitterLayerViewController(), animated: true)
        case demos[10]:
            self.navigationController!.pushViewController(CIFilterTransitionViewController(), animated: true)
        case demos[11]:
            self.navigationController!.pushViewController(DynamicsViewController(), animated: true)
        case demos[12]:
            self.navigationController!.pushViewController(CustomeDynamicsBehaviorViewController(), animated: true)
        case demos[13]:
            self.navigationController!.pushViewController(AnimationAutoLayoutViewController(), animated: true)
        default:
            break
        }
    }
}
