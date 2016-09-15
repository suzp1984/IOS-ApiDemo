
import UIKit

class Layermask2ViewController: UIViewController {

    let which = 2
    var iv: UIImageView!
    
    func maskOfSize(_ sz:CGSize, roundingCorners rad:CGFloat) -> CALayer {
        let r = CGRect(origin:CGPoint.zero, size:sz)
        UIGraphicsBeginImageContextWithOptions(r.size, false, 0)
        let con = UIGraphicsGetCurrentContext()!
        con.setFillColor(UIColor(white:0, alpha:0).cgColor)
        con.fill(r)
        con.setFillColor(UIColor(white:0, alpha:1).cgColor)
        let p = UIBezierPath(roundedRect:r, cornerRadius:rad)
        p.fill()
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let mask = CALayer()
        mask.frame = r
        mask.contents = im?.cgImage
        return mask
    }
    
    func viewMaskOfSize(_ sz:CGSize, roundingCorners rad:CGFloat) -> UIView {
        let r = CGRect(origin:CGPoint.zero, size:sz)
        UIGraphicsBeginImageContextWithOptions(r.size, false, 0)
        let con = UIGraphicsGetCurrentContext()!
        con.setFillColor(UIColor(white:0, alpha:0).cgColor)
        con.fill(r)
        con.setFillColor(UIColor(white:0, alpha:1).cgColor)
        let p = UIBezierPath(roundedRect:r, cornerRadius:rad)
        p.fill()
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let iv = UIImageView(frame:CGRect(origin: CGPoint(), size: sz))
        iv.contentMode = .scaleToFill
        iv.image = im
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return iv
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.iv = UIImageView(image: UIImage(named: "Moi"))
        self.view.addSubview(self.iv)
        
        self.iv.translatesAutoresizingMaskIntoConstraints = false
        self.iv.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.iv.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switch which {
        case 1:
            let mask = maskOfSize(self.iv.bounds.size, roundingCorners:20)
            self.iv.layer.mask = mask
        case 2:
            let mask = viewMaskOfSize(self.iv.bounds.size, roundingCorners:20)
            print(self.iv.layer.mask)
            
            self.iv.mask = mask
            // same effect, but we've added a subview that does the masking
            // but this does not help, for instance, with the rotation problem
            // (the mask is not resized on rotation;
            // in fact, as far as I can tell, autoresizing doesn't work on the mask view)
            
            print(self.iv.layer.mask)
        default: break
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
