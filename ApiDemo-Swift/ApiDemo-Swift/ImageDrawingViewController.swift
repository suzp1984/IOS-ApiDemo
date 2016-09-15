//
//  ImageDrawingViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 5/16/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ImageDrawingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let iv1 = UIImageView()
        let iv2 = UIImageView()
        let iv3 = UIImageView()
        let iv4 = UIImageView()
        let iv5 = UIImageView()
        let iv6 = UIImageView()
        let iv7 = UIImageView()
        
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv2.translatesAutoresizingMaskIntoConstraints = false
        iv3.translatesAutoresizingMaskIntoConstraints = false
        iv4.translatesAutoresizingMaskIntoConstraints = false
        iv5.translatesAutoresizingMaskIntoConstraints = false
        iv6.translatesAutoresizingMaskIntoConstraints = false
        iv7.translatesAutoresizingMaskIntoConstraints = false
        
        iv1.widthAnchor.constraint(equalToConstant: 106).isActive = true
        iv1.heightAnchor.constraint(equalToConstant: 54).isActive = true
        iv2.widthAnchor.constraint(equalToConstant: 106).isActive = true
        iv2.heightAnchor.constraint(equalToConstant: 106).isActive = true
        iv3.widthAnchor.constraint(equalToConstant: 106).isActive = true
        iv3.heightAnchor.constraint(equalToConstant: 54).isActive = true
        iv4.widthAnchor.constraint(equalToConstant: 106).isActive = true
        iv4.heightAnchor.constraint(equalToConstant: 54).isActive = true
        iv5.widthAnchor.constraint(equalToConstant: 106).isActive = true
        iv5.heightAnchor.constraint(equalToConstant: 54).isActive = true
        iv6.widthAnchor.constraint(equalToConstant: 106).isActive = true
        iv6.heightAnchor.constraint(equalToConstant: 54).isActive = true
        iv7.widthAnchor.constraint(equalToConstant: 106).isActive = true
        iv7.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        self.view.addSubview(iv1)
        self.view.addSubview(iv2)
        self.view.addSubview(iv3)
        self.view.addSubview(iv4)
        self.view.addSubview(iv5)
        self.view.addSubview(iv6)
        self.view.addSubview(iv7)
        
        let vs = ["iv1":iv1, "iv2":iv2, "iv3": iv3, "iv4": iv4, "iv5": iv5, "iv6":iv6, "iv7": iv7, "tlg":self.topLayoutGuide] as [String : Any]
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-(10)-[iv1]-(10)-[iv3]-(10)-[iv4]-(10)-[iv5]-(10)-[iv6]-(10)-[iv7]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-(10)-[iv2]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv1]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:[iv2]-(10)-|", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv3]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv4]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv5]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv6]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[iv7]", options: [], metrics: nil, views: vs as [String : AnyObject])
            ].flatMap{$0})
        
//        NSLayoutConstraint.activateConstraints([
//            iv1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv1.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
//            iv2.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: 20),
//            iv2.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
//            iv3.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv3.topAnchor.constraintEqualToAnchor(iv1.bottomAnchor, constant: 20),
//            iv4.topAnchor.constraintEqualToAnchor(iv3.bottomAnchor, constant: 20),
//            iv4.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv5.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv5.topAnchor.constraintEqualToAnchor(iv4.bottomAnchor, constant: 20),
//            iv6.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv6.topAnchor.constraintEqualToAnchor(iv5.bottomAnchor, constant: 20),
//            iv7.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20),
//            iv7.topAnchor.constraintEqualToAnchor(iv6.bottomAnchor, constant: 20)
//            ])
        
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: sz.width*2, height: sz.height), false, 0)
            mars.draw(at: CGPoint(x: 0,y: 0))
            mars.draw(at: CGPoint(x: sz.width,y: 0))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            iv1.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: sz.width*2, height: sz.height*2), false, 0)
            mars.draw(in: CGRect(x: 0,y: 0,width: sz.width*2, height: sz.height*2))
            mars.draw(in: CGRect(x: sz.width/2.0, y: sz.height/2.0, width: sz.width, height: sz.height), blendMode: .multiply, alpha: 1.0)
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            iv2.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: sz.width/2.0, height: sz.height), false, 0)
            mars.draw(at: CGPoint(x: -sz.width/2.0,y: 0))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            iv3.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            // extract each half as CGImage
            let marsCG = mars.cgImage
            let sz = mars.size
            let marsLeft = marsCG?.cropping(to: CGRect(x: 0,y: 0,width: sz.width/2.0,height: sz.height))
            let marsRight = marsCG?.cropping(to: CGRect(x: sz.width/2.0,y: 0,width: sz.width/2.0,height: sz.height))
            // draw each CGImage
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: sz.width*1.5, height: sz.height), false, 0)
            let con = UIGraphicsGetCurrentContext()!
            con.draw(marsLeft!, in: CGRect(x: 0,y: 0,width: sz.width/2.0,height: sz.height))
            con.draw(marsRight!, in: CGRect(x: sz.width,y: 0,width: sz.width/2.0,height: sz.height))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv4.image = im
            // flipped!
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            // extract each half as CGImage
            let sz = mars.size
            let marsCG = mars.cgImage
            let marsLeft = marsCG?.cropping(to: CGRect(x: 0,y: 0,width: sz.width/2.0,height: sz.height))
            let marsRight = marsCG?.cropping(to: CGRect(x: sz.width/2.0,y: 0,width: sz.width/2.0,height: sz.height))
            // draw each CGImage flipped
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: sz.width*1.5, height: sz.height), false, 0)
            let con = UIGraphicsGetCurrentContext()!
            con.draw(flip(marsLeft!), in: CGRect(x: 0,y: 0,width: sz.width/2.0,height: sz.height))
            con.draw(flip(marsRight!), in: CGRect(x: sz.width,y: 0,width: sz.width/2.0,height: sz.height))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv5.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            let marsCG = mars.cgImage
            let szCG = CGSize(width: CGFloat((marsCG?.width)!), height: CGFloat((marsCG?.height)!))
            let marsLeft =
                marsCG?.cropping(to: CGRect(x: 0,y: 0,width: szCG.width/2.0,height: szCG.height))
            let marsRight =
                marsCG?.cropping(to: CGRect(x: szCG.width/2.0,y: 0,width: szCG.width/2.0,height: szCG.height))
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: sz.width*1.5, height: sz.height), false, 0)
            // the rest as before, draw each CGImage flipped
            let con = UIGraphicsGetCurrentContext()!
            con.draw(flip(marsLeft!), in: CGRect(x: 0,y: 0,width: sz.width/2.0,height: sz.height))
            con.draw(flip(marsRight!), in: CGRect(x: sz.width,y: 0,width: sz.width/2.0,height: sz.height))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv6.image = im
        }
        
        // ======
        
        do {
            let mars = UIImage(named:"Mars")!
            let sz = mars.size
            let marsCG = mars.cgImage
            let szCG = CGSize(width: CGFloat((marsCG?.width)!), height: CGFloat((marsCG?.height)!))
            let marsLeft =
                marsCG?.cropping(to: CGRect(x: 0,y: 0,width: szCG.width/2.0,height: szCG.height))
            let marsRight =
                marsCG?.cropping(to: CGRect(x: szCG.width/2.0,y: 0,width: szCG.width/2.0,height: szCG.height))
            UIGraphicsBeginImageContextWithOptions(
                CGSize(width: sz.width*1.5, height: sz.height), false, 0)
            // instead of calling flip, pass through UIImage
            UIImage(cgImage: marsLeft!, scale: mars.scale,
                orientation: mars.imageOrientation)
                .draw(at: CGPoint(x: 0,y: 0))
            UIImage(cgImage: marsRight!, scale: mars.scale,
                orientation: mars.imageOrientation)
                .draw(at: CGPoint(x: sz.width,y: 0))
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // no memory management
            iv7.image = im
        }

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
    
    func flip (_ im: CGImage) -> CGImage {
        let sz = CGSize(width: CGFloat(im.width), height: CGFloat(im.height))
        UIGraphicsBeginImageContextWithOptions(sz, false, 0)
        UIGraphicsGetCurrentContext()!.draw(im, in: CGRect(x: 0, y: 0, width: sz.width, height: sz.height))
        let result = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        return result!
    }


}
