
import UIKit

class ImageViewAnimationViewController: UIViewController {

    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        // UIImage animationImages
        let mars = UIImage(named: "Mars")!
        UIGraphicsBeginImageContextWithOptions(mars.size, false, 0)
        let empty = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let mars_arr = [mars, empty, mars, empty, mars]
        let mars_iv = UIImageView(image:empty)
        mars_iv.frame.origin = CGPoint(x: 100,y: 100)
        self.view.addSubview(mars_iv)
        
        mars_iv.animationImages = mars_arr
        mars_iv.animationDuration = 2
        mars_iv.animationRepeatCount = 0
        mars_iv.startAnimating()
        
        // animated Image with Images
        var howdy_arr = [UIImage]()
        let w : CGFloat = 18
        for i in 0 ..< 6 {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: w,height: w), false, 0)
            let con = UIGraphicsGetCurrentContext()!
            con.setFillColor(UIColor.red.cgColor)
            let ii = CGFloat(i)
            con.addEllipse(in: CGRect(x: 0+ii,y: 0+ii,width: w-ii*2,height: w-ii*2))
            con.fillPath()
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            howdy_arr += [im]
        }
        let howdy_im = UIImage.animatedImage(with: howdy_arr, duration:0.5)
        let howdy_b = UIButton(type:.system)
        howdy_b.setTitle("Howdy", for:UIControlState())
        howdy_b.setImage(howdy_im, for:UIControlState())
        howdy_b.center = CGPoint(x: 100,y: 200)
        howdy_b.sizeToFit()
        self.view.addSubview(howdy_b)
        
        // animated Image Named
        let pac_im = UIImage.animatedImageNamed("pac", duration:1)
        let pac_b = UIButton(type:.system)
        pac_b.setImage(pac_im, for:UIControlState())
        pac_b.center = CGPoint(x: 100,y: 200)
        pac_b.sizeToFit()
        self.view.addSubview(pac_b)
        
        mars_iv.translatesAutoresizingMaskIntoConstraints = false
        howdy_b.translatesAutoresizingMaskIntoConstraints = false
        pac_b.translatesAutoresizingMaskIntoConstraints = false
        
        mars_iv.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        howdy_b.topAnchor.constraint(equalTo: mars_iv.bottomAnchor).isActive = true
        pac_b.topAnchor.constraint(equalTo: howdy_b.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
