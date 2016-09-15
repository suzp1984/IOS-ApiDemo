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

        self.view.backgroundColor = UIColor.white
        
        let playBtn = UIButton(type: .system)
        playBtn.setTitle("Play", for: UIControlState())
        playBtn.addTarget(self, action: #selector(AudioPlayViewController.playAudio(_:)), for: .touchUpInside)
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(playBtn)
        
        NSLayoutConstraint.activate([
                playBtn.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                playBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playAudio(_ sender: UIButton) {
        if let sndUrl = Bundle.main.url(forResource: "test", withExtension: "aif") {
            // print("play Test now")
            sender.isEnabled = false
            var snd : SystemSoundID = 0
            AudioServicesCreateSystemSoundID(sndUrl as CFURL, &snd)
            AudioServicesPlaySystemSoundWithCompletion(snd, { () in
                sender.isEnabled = true
                AudioServicesDisposeSystemSoundID(snd)
            })
        }
    }
}
