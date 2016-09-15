
import UIKit

class UIViewAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let v1 = UIView()
        self.view.addSubview(v1)
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v1.backgroundColor = UIColor.blue
        v1.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        v1.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        UIView.animate(withDuration: 2, animations: {
            v1.backgroundColor = UIColor.red
        })
        
        let v2 = UIView()
        self.view.addSubview(v2)
        v2.backgroundColor = UIColor.yellow
        
        v2.translatesAutoresizingMaskIntoConstraints = false
        v2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v2.topAnchor.constraint(equalTo: v1.bottomAnchor).isActive = true
        v2.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        UIView.animate(withDuration: 2, animations: {
            v2.backgroundColor = UIColor.cyan
            v2.center.x += 100
        })
        
        let v3 = UIView()
        let v4 = UIView()
        self.view.addSubview(v3)
        self.view.addSubview(v4)
        v3.backgroundColor = UIColor.brown
        v4.backgroundColor = UIColor.black
        
        v3.translatesAutoresizingMaskIntoConstraints = false
        v4.translatesAutoresizingMaskIntoConstraints = false
        v3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v4.widthAnchor.constraint(equalTo: v3.widthAnchor).isActive = true
        v4.heightAnchor.constraint(equalTo: v3.heightAnchor).isActive = true
        
        v3.topAnchor.constraint(equalTo: v2.bottomAnchor).isActive = true
        v3.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        v4.topAnchor.constraint(equalTo: v3.topAnchor).isActive = true
        v4.leftAnchor.constraint(equalTo: v3.leftAnchor).isActive = true
        v3.alpha = 1
        v4.alpha = 0
        UIView.animate(withDuration: 2, animations: {
            v4.alpha = 1
            v3.alpha = 0
        })
        
        let v5 = UIView()
        v5.backgroundColor = UIColor.darkGray
        v5.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v5)
        v5.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v5.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v5.topAnchor.constraint(equalTo: v3.bottomAnchor).isActive = true
        v5.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        UIView.animate(withDuration: 2, animations: {
            v5.backgroundColor = UIColor.green
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
