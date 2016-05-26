
import UIKit

class CompassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let compass = CompassView()
        self.view.addSubview(compass)
        
        compass.translatesAutoresizingMaskIntoConstraints = false
        compass.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor).active = true
        compass.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        compass.heightAnchor.constraintEqualToAnchor(compass.widthAnchor).active = true
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
