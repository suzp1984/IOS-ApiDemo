//
//  GroupedAnimationViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/20/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class GroupedAnimationViewController: UIViewController {

    var v : UIView!
    var downside : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        //self.v = UIView(frame: CGRectMake(254, 28, 56, 38))
        self.v = UIView()
        //self.v.backgroundColor = UIColor.whiteColor()
        self.v.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v)
        self.v.layer.contents = UIImage(named: "boat.gif")!.cgImage
        // self.v.layer.contentsRect = CGRectMake(0, 0, 56, 38)
        self.v.layer.contentsGravity = kCAGravityResizeAspectFill
        self.v.widthAnchor.constraint(equalToConstant: 56).isActive = true
        self.v.heightAnchor.constraint(equalToConstant: 38).isActive = true
        self.v.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        self.v.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        
        let button = UIButton(type: .system)
        button.setTitle("Animate", for: UIControlState())
        button.addTarget(self, action: #selector(GroupedAnimationViewController.animate), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
    }

    func animate() -> Void {
        let h : CGFloat = 200
        let v : CGFloat = downside ? 75 : -75
        downside = !downside
        let path = CGMutablePath()
        var leftright : CGFloat = 1
        var next : CGPoint = self.v.layer.position
        var pos : CGPoint
        path.move(to: CGPoint(x: next.x, y: next.y))
        // CGPathMoveToPoint(path, nil, next.x, next.y)
        for _ in 0 ..< 4 {
            pos = next
            leftright *= -1
            next = CGPoint(x: pos.x+h*leftright, y: pos.y+v)
            path.addCurve(to: CGPoint(x: pos.x, y: pos.y+30),
                          control1: CGPoint(x: next.x, y: next.y-30),
                          control2: CGPoint(x: next.x, y: next.y))
//            CGPathAddCurveToPoint(path, nil,
//                                  pos.x, pos.y+30,
//                                  next.x, next.y-30,
//                                  next.x, next.y)
        }
        let anim1 = CAKeyframeAnimation(keyPath:"position")
        anim1.path = path
        anim1.calculationMode = kCAAnimationPaced
        
        let revs = [0.0, M_PI, 0.0, M_PI]
        let anim2 = CAKeyframeAnimation(keyPath:"transform")
        anim2.values = revs
        anim2.valueFunction = CAValueFunction(name:kCAValueFunctionRotateY)
        anim2.calculationMode = kCAAnimationDiscrete
        
        let pitches = [0.0, M_PI/60.0, 0.0, -M_PI/60.0, 0.0]
        let anim3 = CAKeyframeAnimation(keyPath:"transform")
        anim3.values = pitches
        anim3.repeatCount = Float.infinity
        anim3.duration = 0.5
        anim3.isAdditive = true
        anim3.valueFunction = CAValueFunction(name:kCAValueFunctionRotateZ)
        
        let group = CAAnimationGroup()
        group.animations = [anim1, anim2, anim3]
        group.duration = 8
        self.v.layer.add(group, forKey:nil)
        CATransaction.setDisableActions(true)
        self.v.layer.position = next

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
