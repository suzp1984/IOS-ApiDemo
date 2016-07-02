
import UIKit

class UIViewAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        let v1 = UIView()
        self.view.addSubview(v1)
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.widthAnchor.constraintEqualToConstant(100).active = true
        v1.heightAnchor.constraintEqualToConstant(100).active = true
        v1.backgroundColor = UIColor.blueColor()
        v1.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor).active = true
        v1.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        
        UIView.animateWithDuration(2, animations: {
            v1.backgroundColor = UIColor.redColor()
        })
        
        let v2 = UIView()
        self.view.addSubview(v2)
        v2.backgroundColor = UIColor.yellowColor()
        
        v2.translatesAutoresizingMaskIntoConstraints = false
        v2.widthAnchor.constraintEqualToConstant(100).active = true
        v2.heightAnchor.constraintEqualToConstant(100).active = true
        v2.topAnchor.constraintEqualToAnchor(v1.bottomAnchor).active = true
        v2.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        
        UIView.animateWithDuration(2, animations: {
            v2.backgroundColor = UIColor.cyanColor()
            v2.center.x += 100
        })
        
        let v3 = UIView()
        let v4 = UIView()
        self.view.addSubview(v3)
        self.view.addSubview(v4)
        v3.backgroundColor = UIColor.brownColor()
        v4.backgroundColor = UIColor.blackColor()
        
        v3.translatesAutoresizingMaskIntoConstraints = false
        v4.translatesAutoresizingMaskIntoConstraints = false
        v3.widthAnchor.constraintEqualToConstant(100).active = true
        v3.heightAnchor.constraintEqualToConstant(100).active = true
        v4.widthAnchor.constraintEqualToAnchor(v3.widthAnchor).active = true
        v4.heightAnchor.constraintEqualToAnchor(v3.heightAnchor).active = true
        
        v3.topAnchor.constraintEqualToAnchor(v2.bottomAnchor).active = true
        v3.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        v4.topAnchor.constraintEqualToAnchor(v3.topAnchor).active = true
        v4.leftAnchor.constraintEqualToAnchor(v3.leftAnchor).active = true
        v3.alpha = 1
        v4.alpha = 0
        UIView.animateWithDuration(2, animations: {
            v4.alpha = 1
            v3.alpha = 0
        })
        
        let v5 = UIView()
        v5.backgroundColor = UIColor.darkGrayColor()
        v5.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v5)
        v5.widthAnchor.constraintEqualToConstant(100).active = true
        v5.heightAnchor.constraintEqualToConstant(100).active = true
        v5.topAnchor.constraintEqualToAnchor(v3.bottomAnchor).active = true
        v5.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        UIView.animateWithDuration(2, animations: {
            v5.backgroundColor = UIColor.greenColor()
            UIView.performWithoutAnimation{
                v5.center.y += 100
            }
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
