//
//  ImageFilter2ViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/17/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageFilter2ViewController: UIViewController {

    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv)
        
        NSLayoutConstraint.activate([
            iv.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
            iv.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            iv.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            iv.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -20)
            ])
        
        let vig = MyVignetteFilter()
        let moici = CIImage(image: UIImage(named:"Moi")!)!
        vig.setValuesForKeys([
            "inputImage":moici,
            "inputPercentage":0.7
            ])
        let outim = vig.outputImage!
        
        let outimcg = self.context.createCGImage(outim, from: outim.extent)
        iv.image = UIImage(cgImage: outimcg!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
