

import UIKit

class ImageFilter1ViewController: UIViewController {
    
    let iv  = UIImageView()
    let context = CIContext(options:nil)
    var filter = 0;
    
    var blendimage : CIImage! = nil
    var moiextent : CGRect! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iv.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
            iv.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            iv.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            iv.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -20)
            ])
        
        // add button
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Filter", for: UIControlState())
        button.addTarget(self, action: #selector(ImageFilter1ViewController.changeFilter), for: .touchUpInside)
        
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10)
            ])
        
        let moi = UIImage(named:"Moi")!
        let moici = CIImage(image:moi)!
        
        moiextent = moici.extent
        
        
        let center = CIVector(x: moiextent.width/2.0, y: moiextent.height/2.0)
        
        let smallerDimension = min(moiextent.width, moiextent.height)
        let largerDimension = max(moiextent.width, moiextent.height)
        
        // first filter
        let grad = CIFilter(name: "CIRadialGradient")!
        grad.setValue(center, forKey:"inputCenter")
        grad.setValue(smallerDimension/2.0 * 0.85, forKey:"inputRadius0")
        grad.setValue(largerDimension/2.0, forKey:"inputRadius1")
        let gradimage = grad.outputImage!
        
        
        // second filter
        blendimage = moici.applyingFilter(
            "CIBlendWithMask", withInputParameters: [
                "inputMaskImage":gradimage
            ])
        
     
        changeFilter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeFilter() -> Void {
        print("Change Filter")
        filter = filter % 3;
        switch filter {
        case 0:
            let moicg = self.context.createCGImage(self.blendimage, from: self.moiextent)
            self.iv.image = UIImage(cgImage: moicg!)
        case 1:
            UIGraphicsBeginImageContextWithOptions(self.moiextent.size, false, 0)
            UIImage(ciImage: self.blendimage).draw(in: self.moiextent)
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.iv.image = im
        case 2:
            self.iv.image = UIImage(ciImage: self.blendimage) // nope
        default: break
        }

        filter += 1
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
