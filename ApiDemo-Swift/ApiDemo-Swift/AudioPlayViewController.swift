//
//  AudioPlayViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit
import AudioToolbox

class AudioPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let playBtn = UIButton(type: .System)
        playBtn.setTitle("Play", forState: .Normal)
        playBtn.addTarget(self, action: #selector(AudioPlayViewController.playAudio(_:)), forControlEvents: .TouchUpInside)
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(playBtn)
        
        NSLayoutConstraint.activateConstraints([
                playBtn.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                playBtn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playAudio(sender: UIButton) {
        if let sndUrl = NSBundle.mainBundle().URLForResource("test", withExtension: "aif") {
            // print("play Test now")
            sender.enabled = false
            var snd : SystemSoundID = 0
            AudioServicesCreateSystemSoundID(sndUrl, &snd)
            AudioServicesPlaySystemSoundWithCompletion(snd, { () in
                sender.enabled = true
                AudioServicesDisposeSystemSoundID(snd)
            })
        }
    }
}
