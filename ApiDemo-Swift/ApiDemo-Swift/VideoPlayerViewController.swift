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

        self.view.backgroundColor = UIColor.white
     
        let button = UIButton(type: .system)
        button.setTitle("Video Player", for: UIControlState())
        button.addTarget(self, action: #selector(VideoPlayerViewController.playVideo(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playVideo(_ sender: UIButton) {
        let av = AVPlayerViewController()
        if let url = Bundle.main.url(forResource: "ElMirage", withExtension: "mp4") {
            let player = AVPlayer(url: url)
            av.player = player
            self.present(av, animated: true, completion: nil)
        }
    }
}
