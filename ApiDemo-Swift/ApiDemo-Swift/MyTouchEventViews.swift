//
//  MyTouchEventViews.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/23/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

class MyEventView0 : UIView {
    
    override func touchesMoved(_ touches: Set<UITouch>, with e: UIEvent?) {
        self.superview!.bringSubview(toFront: self)
        
        let t = touches.first!
        let loc = t.location(in: self.superview)
        let oldP = t.previousLocation(in: self.superview)
        let deltaX = loc.x - oldP.x
        let deltaY = loc.y - oldP.y
        var c = self.center
        c.x += deltaX
        c.y += deltaY
        self.center = c
    }
    
}

class MyEventView1 : UIView {
    var decided = false
    var horiz = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with e: UIEvent?) {
        self.decided = false
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with e: UIEvent?) {
        self.superview!.bringSubview(toFront: self)
        
        let t = touches.first!
        
        if !self.decided {
            self.decided = true
            let then = t.previousLocation(in: self)
            let now = t.location(in: self)
            let deltaX = fabs(then.x - now.x)
            let deltaY = fabs(then.y - now.y)
            self.horiz = deltaX >= deltaY
        }
        
        let loc = t.location(in: self.superview)
        let oldP = t.previousLocation(in: self.superview)
        let deltaX = loc.x - oldP.x
        let deltaY = loc.y - oldP.y
        var c = self.center
        if self.horiz {
            c.x += deltaX
        } else {
            c.y += deltaY
        }
        self.center = c
    }
}

class MyEventView2 : UIView {
    var time : TimeInterval!
    var single = false
    
    /*
     
     override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
     self.time = (touches.anyObject() as UITouch).timestamp
     }
     
     override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
     let diff = event.timestamp - self.time
     if (diff < 0.4) {
     print("short")
     } else {
     print("long")
     }
     }
     
     */
    
    // see 54cf020903 for an earlier, overblown attempt using timer dispatch source
    // (because they can be cancelled, unlike dispatch_after)
    // see also http://stackoverflow.com/questions/8113268/how-to-cancel-nsblockoperation
    // but I don't think any of that is needed here, any more than
    // any complexity was needed with cancel...requests, as it is a single main-thread cancellation
    
    override func touchesBegan(_ touches: Set<UITouch>, with e: UIEvent?) {
        let ct = touches.first!.tapCount
        switch ct {
        case 2:
            self.single = false
        default: break
        }
        // logging to show that location in the window gives a very different result in iOS 8 from iOS 7
        let t = touches.first!
        print(t.location(in: self))
        print(t.location(in: self.window!))
        print(t.location(in: nil))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with e: UIEvent?) {
        let ct = touches.first!.tapCount
        switch ct {
        case 1:
            self.single = true
            delay(0.3) {
                if self.single { // no second tap intervened
                    print("single tap")
                }
            }
        case 2:
            print("double tap")
        default: break
        }
    }
    
    // dropped the long-press example
    /*
     - (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
     self->_time = [(UITouch*)touches.anyObject timestamp];
     [self performSelector:@selector(touchWasLong)
     withObject:nil afterDelay:0.4];
     }
     
     - (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
     NSTimeInterval diff = event.timestamp - self->_time;
     if (diff < 0.4) {
     NSLog(@"short");
     [NSObject cancelPreviousPerformRequestsWithTarget:self
     selector:@selector(touchWasLong)
     object:nil];
     }
     */
}

class MyEventView3 : UIView {
    var decidedDirection = false
    var horiz = false
    var decidedTapOrDrag = false
    var drag = false
    var single = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with e: UIEvent?) {
        // be undecided
        self.decidedTapOrDrag = false
        // prepare for a tap
        let ct = touches.first!.tapCount
        switch ct {
        case 2:
            self.single = false
            self.decidedTapOrDrag = true
            self.drag = false
            return
        default: break
        }
        // prepare for a drag
        self.decidedDirection = false
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with e: UIEvent?) {
        if self.decidedTapOrDrag && !self.drag {return}
        
        self.superview!.bringSubview(toFront: self)
        let t = touches.first!
        
        self.decidedTapOrDrag = true
        self.drag = true
        if !self.decidedDirection {
            self.decidedDirection = true
            let then = t.previousLocation(in: self)
            let now = t.location(in: self)
            let deltaX = fabs(then.x - now.x)
            let deltaY = fabs(then.y - now.y)
            self.horiz = deltaX >= deltaY
        }
        let loc = t.location(in: self.superview)
        let oldP = t.previousLocation(in: self.superview)
        let deltaX = loc.x - oldP.x
        let deltaY = loc.y - oldP.y
        var c = self.center
        if self.horiz {
            c.x += deltaX
        } else {
            c.y += deltaY
        }
        self.center = c
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with e: UIEvent?) {
        if !self.decidedTapOrDrag || !self.drag {
            // end for a tap
            let ct = touches.first!.tapCount
            switch ct {
            case 1:
                self.single = true
                delay(0.3) {
                    if self.single {
                        print("single tap")
                    }
                }
            case 2:
                print("double tap")
            default: break
            }
        }
    }
    
}

