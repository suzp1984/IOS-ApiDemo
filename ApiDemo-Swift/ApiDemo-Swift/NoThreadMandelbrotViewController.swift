//
//  NoThreadMandelbrotViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/3/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class NoThreadMandelbrotViewController: UIViewController {

    var mandelbrot : MandelbrotView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let mandelbrot = MandelbrotView()
        mandelbrot.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mandelbrot)
        NSLayoutConstraint.activateConstraints([
                mandelbrot.widthAnchor.constraintEqualToConstant(350),
                mandelbrot.heightAnchor.constraintEqualToConstant(250),
                mandelbrot.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                mandelbrot.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        mandelbrot.backgroundColor = UIColor.redColor()
        self.mandelbrot = mandelbrot
        
        let button = UIButton(type: .System)
        button.setTitle("draw puppy", forState: .Normal)
        button.addTarget(self, action: #selector(NoThreadMandelbrotViewController.doDraw(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                button.topAnchor.constraintEqualToAnchor(mandelbrot.bottomAnchor, constant: 20),
                button.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doDraw(sender: UIButton) {
        if let mandelbrot = self.mandelbrot {
            mandelbrot.drawThatPuppy()
        }
    }
}
