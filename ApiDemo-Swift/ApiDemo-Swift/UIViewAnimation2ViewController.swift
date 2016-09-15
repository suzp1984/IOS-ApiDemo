
import UIKit

class UIViewAnimation2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.blue
        v1.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        self.view.addSubview(v1)
        
        UIView.animate(withDuration: 2, animations: {
            v1.center.x += 100
        })
        
        let v2 = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        v2.backgroundColor = UIColor.yellow
        
        self.view.addSubview(v2)
        var start = 0.0
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: 1.0, animations: {
                v2.center.x += 80
                v2.backgroundColor = UIColor.black
            })
            
            start += 1.0
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: 1.0, animations: {
                v2.center.x += 80
                v2.backgroundColor = UIColor.red
            })
            
            start += 1.0
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: 1.0, animations: {
                v2.center.x -= 80
                v2.backgroundColor = UIColor.brown
            })
            
            start += 1.0
            UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: 1.0, animations: {
                v2.center.x += 20
                v2.backgroundColor = UIColor.cyan
            })
            }, completion: nil)
        
        let v3 = UIView()
        v3.translatesAutoresizingMaskIntoConstraints = false
        v3.backgroundColor = UIColor.blue
        self.view.addSubview(v3)
        v3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v3.topAnchor.constraint(equalTo: v2.bottomAnchor).isActive = true
        v3.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100).isActive = true
        
        v3.layoutIfNeeded()
        UIView.animate(withDuration: 2, animations: {
            //v3.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 200).active = true
            v3.center.x += 100
            v3.layoutIfNeeded()
        })
        
        let v4 = UIView(frame: CGRect(x: 100, y: 400, width: 100, height: 100))
        v4.backgroundColor = UIColor.red
        self.view.addSubview(v4)
        UIView.animate(withDuration: 2.0, delay: 0,
                                   usingSpringWithDamping: 0.1,
                                   initialSpringVelocity: 2,
                                   options: UIViewAnimationOptions.autoreverse,
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
