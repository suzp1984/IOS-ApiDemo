
import UIKit

class LayerHierarchyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1).cgColor
        layer1.frame = CGRect(x: 113, y: 111, width: 132, height: 194)
        self.view.layer.addSublayer(layer1)
        
        let layer2 = CALayer()
        layer2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).cgColor
        layer2.frame = CGRect(x: 41, y: 56, width: 132, height: 194)
        layer1.addSublayer(layer2)
        
        let layer3 = CALayer()
        let im = UIImage(named: "smiley")!
        layer3.frame = CGRect(origin: CGPoint(x: 180, y: 180), size: im.size)
        layer3.contents = im.cgImage
        
        self.view.layer.addSublayer(layer3)
        
        let layer4 = CALayer()
        layer4.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        layer4.frame = CGRect(x: 43, y: 197, width: 160, height: 230)
        self.view.layer.addSublayer(layer4)
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
