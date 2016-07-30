//
//  EmbededVideoViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class EmbededVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        if let url = NSBundle.mainBundle().URLForResource("ElMirage", withExtension: "mp4") {
            let player = AVPlayer(URL: url)
            let av = AVPlayerViewController()
            av.player = player
            av.view.frame = CGRectMake(10, 100, 300, 200)
            self.addChildViewController(av)
            self.view.addSubview(av.view)
            av.didMoveToParentViewController(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
