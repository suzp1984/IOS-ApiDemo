
import UIKit

class UIViewAnimation2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.blueColor()
        v1.frame = CGRectMake(100, 100, 100, 100)
        
        self.view.addSubview(v1)
        
        UIView.animateWithDuration(2, animations: {
            v1.center.x += 100
        })
        
        let v2 = UIView(frame: CGRectMake(100, 200, 100, 100))
        v2.backgroundColor = UIColor.yellowColor()
        
        self.view.addSubview(v2)
        var start = 0.0
        UIView.animateKeyframesWithDuration(4, delay: 0, options: [], animations: {
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: 1.0, animations: {
                v2.center.x += 80
                v2.backgroundColor = UIColor.blackColor()
            })
            
            start += 1.0
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: 1.0, animations: {
                v2.center.x += 80
                v2.backgroundColor = UIColor.redColor()
            })
            
            start += 1.0
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: 1.0, animations: {
                v2.center.x -= 80
                v2.backgroundColor = UIColor.brownColor()
            })
            
            start += 1.0
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: 1.0, animations: {
                v2.center.x += 20
                v2.backgroundColor = UIColor.cyanColor()
            })
            }, completion: nil)
        
        let v3 = UIView()
        v3.translatesAutoresizingMaskIntoConstraints = false
        v3.backgroundColor = UIColor.blueColor()
        self.view.addSubview(v3)
        v3.widthAnchor.constraintEqualToConstant(100).active = true
        v3.heightAnchor.constraintEqualToConstant(100).active = true
        v3.topAnchor.constraintEqualToAnchor(v2.bottomAnchor).active = true
        v3.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 100).active = true
        
        v3.layoutIfNeeded()
        UIView.animateWithDuration(2, animations: {
            //v3.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 200).active = true
            v3.center.x += 100
            v3.layoutIfNeeded()
        })
        
        let v4 = UIView(frame: CGRectMake(100, 400, 100, 100))
        v4.backgroundColor = UIColor.redColor()
        self.view.addSubview(v4)
        UIView.animateWithDuration(2.0, delay: 0,
                                   usingSpringWithDamping: 0.1,
                                   initialSpringVelocity: 2,
                                   options: UIViewAnimationOptions.Autoreverse,
                                   animations: {
                UIView.setAnimationRepeatCount(3)
                v4.center.x += 100
            }, completion: {
                _ in
                v4.center.x = 150
        })
        
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
