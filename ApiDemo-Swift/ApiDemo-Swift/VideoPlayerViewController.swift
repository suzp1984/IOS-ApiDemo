//
//  VideoPlayerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
     
        let button = UIButton(type: .System)
        button.setTitle("Video Player", forState: .Normal)
        button.addTarget(self, action: #selector(VideoPlayerViewController.playVideo(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                button.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                button.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playVideo(sender: UIButton) {
        let av = AVPlayerViewController()
        if let url = NSBundle.mainBundle().URLForResource("ElMirage", withExtension: "mp4") {
            let player = AVPlayer(URL: url)
            av.player = player
            self.presentViewController(av, animated: true, completion: nil)
        }
    }
}
