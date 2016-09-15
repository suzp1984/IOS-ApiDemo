//
//  OperationMandelbrotViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/3/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class OperationMandelbrotViewController: UIViewController {

    var mandelbrot : OperationMandelbrotView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let mandelbrot = OperationMandelbrotView()
        mandelbrot.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mandelbrot)
        NSLayoutConstraint.activate([
            mandelbrot.widthAnchor.constraint(equalToConstant: 350),
            mandelbrot.heightAnchor.constraint(equalToConstant: 250),
            mandelbrot.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
            mandelbrot.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        mandelbrot.backgroundColor = UIColor.red
        self.mandelbrot = mandelbrot
        
        let button = UIButton(type: .system)
        button.setTitle("draw puppy", for: UIControlState())
        button.addTarget(self, action: #selector(NoThreadMandelbrotViewController.doDraw(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: mandelbrot.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doDraw(_ sender: UIButton) {
        if let mandelbrot = self.mandelbrot {
            mandelbrot.drawThatPuppy()
        }
    }
}
