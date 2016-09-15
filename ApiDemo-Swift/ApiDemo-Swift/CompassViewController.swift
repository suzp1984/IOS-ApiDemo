
import UIKit

class CompassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let compass = CompassView()
        self.view.addSubview(compass)
        
        compass.translatesAutoresizingMaskIntoConstraints = false
        compass.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        compass.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        compass.heightAnchor.constraint(equalTo: compass.widthAnchor).isActive = true
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
