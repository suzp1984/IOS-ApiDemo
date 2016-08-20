import UIKit

class GraphicContextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let v1 = MyView1()
        let v2 = MyView2()
        let v3 = MyView3()
        let v4 = MyView4()
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        v4.translatesAutoresizingMaskIntoConstraints = false
        
        v1.heightAnchor.constraintEqualToConstant(100).active = true
        v1.widthAnchor.constraintEqualToConstant(100).active = true
        
        v2.heightAnchor.constraintEqualToConstant(100).active = true
        v2.widthAnchor.constraintEqualToConstant(100).active = true
        
        v3.heightAnchor.constraintEqualToConstant(100).active = true
        v3.widthAnchor.constraintEqualToConstant(100).active = true
        
        v4.heightAnchor.constraintEqualToConstant(100).active = true
        v4.widthAnchor.constraintEqualToConstant(100).active = true
        
        let iv1 = MyImageView1()
        let iv2 = MyImageView2()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv2.translatesAutoresizingMaskIntoConstraints = false
        
        iv1.widthAnchor.constraintEqualToConstant(100).active = true
        iv1.heightAnchor.constraintEqualToConstant(100).active = true
        iv2.widthAnchor.constraintEqualToConstant(100).active = true
        iv2.heightAnchor.constraintEqualToConstant(100).active = true
        
        self.view.addSubview(v1)
        self.view.addSubview(v2)
        self.view.addSubview(v3)
        self.view.addSubview(v4)
        self.view.addSubview(iv1)
        self.view.addSubview(iv2)
        
        let vs = ["v1":v1, "v2":v2, "v3":v3, "v4":v4, "iv1":iv1, "iv2":iv2, "tlg":self.topLayoutGuide]
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v1]-(>=5)-[v2]-(20)-|", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[v3]-(>=5)-[v4]-(20)-|", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[iv1]-(>=5)-[iv2]-(20)-|", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(20)-[v1]-(20)-[v3]-(20)-[iv1]", options: [], metrics: nil, views: vs as! [String : AnyObject]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[tlg]-(20)-[v2]-(20)-[v4]-(20)-[iv2]", options: [], metrics: nil, views: vs as! [String : AnyObject])
            ].flatMap{$0})
        
        iv1.awakeFromNib()
        iv2.awakeFromNib()
        
        // graphic context
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), false, 1)
        let p = UIBezierPath(ovalInRect: CGRectMake(0,0,100,100))
        UIColor.redColor().setFill()
        p.fill()
        
        let cimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let iv3 = UIImageView(image: cimage)
        iv3.backgroundColor = UIColor.clearColor()
        iv3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv3)
        
        NSLayoutConstraint.activateConstraints([
                iv3.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -10),
                iv3.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: -50)
            ])
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), false, 1)
        
        let ctx = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0, green: 1, blue: 1, alpha: 0).CGColor)
        CGContextFillRect(ctx, CGRectMake(0, 0, 100, 100))
        
        CGContextAddEllipseInRect(ctx, CGRectMake(0,0,100,100))
        CGContextSetFillColorWithColor(ctx, UIColor.blackColor().CGColor)
        CGContextFillPath(ctx)
        
        let yimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let iv4 = UIImageView(image: yimage)
        iv4.backgroundColor = UIColor.clearColor()
        iv4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv4)
        
        NSLayoutConstraint.activateConstraints([
                iv4.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -10),
                iv4.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 50)
            ])
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
