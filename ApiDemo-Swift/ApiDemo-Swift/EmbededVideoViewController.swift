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

        self.view.backgroundColor = UIColor.white
        
        if let url = Bundle.main.url(forResource: "ElMirage", withExtension: "mp4") {
            let player = AVPlayer(url: url)
            let av = AVPlayerViewController()
            av.player = player
            av.view.frame = CGRect(x: 10, y: 100, width: 300, height: 200)
            self.addChildViewController(av)
            self.view.addSubview(av.view)
            av.didMove(toParentViewController: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
