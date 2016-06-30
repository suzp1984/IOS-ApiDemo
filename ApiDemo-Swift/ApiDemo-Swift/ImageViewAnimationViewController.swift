
import UIKit

class ImageViewAnimationViewController: UIViewController {

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UIImage animationImages
        let mars = UIImage(named: "Mars")!
        UIGraphicsBeginImageContextWithOptions(mars.size, false, 0)
        let empty = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let mars_arr = [mars, empty, mars, empty, mars]
        let mars_iv = UIImageView(image:empty)
        mars_iv.frame.origin = CGPointMake(100,100)
        self.view.addSubview(mars_iv)
        
        mars_iv.animationImages = mars_arr
        mars_iv.animationDuration = 2
        mars_iv.animationRepeatCount = 0
        mars_iv.startAnimating()
        
        // animated Image with Images
        var howdy_arr = [UIImage]()
        let w : CGFloat = 18
        for i in 0 ..< 6 {
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(w,w), false, 0)
            let con = UIGraphicsGetCurrentContext()!
            CGContextSetFillColorWithColor(con, UIColor.redColor().CGColor)
            let ii = CGFloat(i)
            CGContextAddEllipseInRect(con, CGRectMake(0+ii,0+ii,w-ii*2,w-ii*2))
            CGContextFillPath(con)
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            howdy_arr += [im]
        }
        let howdy_im = UIImage.animatedImageWithImages(howdy_arr, duration:0.5)
        let howdy_b = UIButton(type:.System)
        howdy_b.setTitle("Howdy", forState:.Normal)
        howdy_b.setImage(howdy_im, forState:.Normal)
        howdy_b.center = CGPointMake(100,200)
        howdy_b.sizeToFit()
        self.view.addSubview(howdy_b)
        
        // animated Image Named
        let pac_im = UIImage.animatedImageNamed("pac", duration:1)
        let pac_b = UIButton(type:.System)
        pac_b.setImage(pac_im, forState:.Normal)
        pac_b.center = CGPointMake(100,200)
        pac_b.sizeToFit()
        self.view.addSubview(pac_b)
        
        mars_iv.translatesAutoresizingMaskIntoConstraints = false
        howdy_b.translatesAutoresizingMaskIntoConstraints = false
        pac_b.translatesAutoresizingMaskIntoConstraints = false
        
        mars_iv.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor).active = true
        howdy_b.topAnchor.constraintEqualToAnchor(mars_iv.bottomAnchor).active = true
        pac_b.topAnchor.constraintEqualToAnchor(howdy_b.bottomAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
