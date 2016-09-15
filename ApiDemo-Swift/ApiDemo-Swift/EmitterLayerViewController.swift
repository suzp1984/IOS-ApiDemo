//
//  EmitterLayerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/21/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class EmitterLayerViewController: UIViewController {

    let which = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 10,height: 10), false, 1)
        let con = UIGraphicsGetCurrentContext()!
        con.addEllipse(in: CGRect(x: 0,y: 0,width: 10,height: 10))
        con.setFillColor(UIColor.gray.cgColor)
        con.fillPath()
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let cell = CAEmitterCell()
        cell.birthRate = 5
        cell.lifetime = 1
        cell.velocity = 100
        cell.contents = im?.cgImage
        
        let emit = CAEmitterLayer()
        emit.emitterPosition = CGPoint(x: 30,y: 100)
        emit.emitterShape = kCAEmitterLayerPoint
        emit.emitterMode = kCAEmitterLayerPoints
        
        emit.emitterCells = [cell]
        self.view.layer.addSublayer(emit)
        
        switch which {
        case 0:
            break
        case 1...5:
            cell.birthRate = 100
            cell.lifetime = 1.5
            cell.velocity = 100
            cell.emissionRange = CGFloat(M_PI)/5.0
            
            cell.xAcceleration = -40
            cell.yAcceleration = 200
            
            cell.lifetimeRange = 0.4
            cell.velocityRange = 20
            cell.scaleRange = 0.2
            cell.scaleSpeed = 0.2
            
            cell.color = UIColor.blue.cgColor
            cell.greenRange = 0.5
            cell.greenSpeed = 0.75
            
            if which > 1 {fallthrough}
            
        case 2...5:
            cell.name = "circle"
            emit.setValue(3.0, forKeyPath:"emitterCells.circle.greenSpeed")
            
            if which > 2 {fallthrough}
            
        case 3...5:
            let key = "emitterCells.circle.greenSpeed"
            let ba = CABasicAnimation(keyPath:key)
            ba.fromValue = -1.0
            ba.toValue = 3.0
            ba.duration = 4
            ba.autoreverses = true
            ba.repeatCount = Float.infinity
            emit.add(ba, forKey:nil)
            
            if which > 3 {fallthrough}
            
        case 4...5:
            let cell2 = CAEmitterCell()
            cell.emitterCells = [cell2]
            cell2.contents = im?.cgImage
            cell2.emissionRange = CGFloat(M_PI)
            cell2.birthRate = 200
            cell2.lifetime = 0.4
            cell2.velocity = 200
            cell2.scale = 0.2
            
            cell2.beginTime = 0.04
            cell2.duration = 0.2
            
            // return;
            
            // these next two lines are not causing the same result on iOS 7 as on iOS 6
            // I have filed a bug on this
            
            cell2.beginTime = 0.7
            cell2.duration = 0.8
            
            // interestingly, it looks about right on iOS 7...
            // ... if we double the beginTime and halve the duration
            
            cell2.beginTime = 1.4
            cell2.duration = 0.4
            
            if which > 4 {fallthrough}
            
        case 5:
            emit.emitterPosition = CGPoint(x: 100,y: 25)
            emit.emitterSize = CGSize(width: 100,height: 100)
            emit.emitterShape = kCAEmitterLayerLine
            emit.emitterMode = kCAEmitterLayerOutline
            cell.emissionLongitude = 3*CGFloat(M_PI)/4
            
            // might also be fun to animate position of source back and forth
            let ba2 = CABasicAnimation(keyPath:"emitterPosition")
            ba2.fromValue = NSValue(cgPoint:CGPoint(x: 30,y: 100))
            ba2.toValue = NSValue(cgPoint:CGPoint(x: 200,y: 100))
            ba2.duration = 6
            ba2.autoreverses = true
            ba2.repeatCount = Float.infinity
            emit.add(ba2, forKey:nil)
            
            
        default: break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
