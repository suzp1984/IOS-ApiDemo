import UIKit

class GraphicContextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let v1 = MyView1()
        let v2 = MyView2()
        let v3 = MyView3()
        let v4 = MyView4()
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        v4.translatesAutoresizingMaskIntoConstraints = false
        
        v1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        v2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        v3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        v4.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v4.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        let iv1 = MyImageView1()
        let iv2 = MyImageView2()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv2.translatesAutoresizingMaskIntoConstraints = false
        
        iv1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iv1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iv2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iv2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.view.addSubview(v1)
        self.view.addSubview(v2)
        self.view.addSubview(v3)
        self.view.addSubview(v4)
        self.view.addSubview(iv1)
        self.view.addSubview(iv2)
        
        let vs = ["v1":v1, "v2":v2, "v3":v3, "v4":v4, "iv1":iv1, "iv2":iv2, "tlg":self.topLayoutGuide] as [String : Any]
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v1]-(>=5)-[v2]-(20)-|", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v3]-(>=5)-[v4]-(20)-|", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[iv1]-(>=5)-[iv2]-(20)-|", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-(20)-[v1]-(20)-[v3]-(20)-[iv1]", options: [], metrics: nil, views: vs as [String : AnyObject]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-(20)-[v2]-(20)-[v4]-(20)-[iv2]", options: [], metrics: nil, views: vs as [String : AnyObject])
            ].flatMap{$0})
        
        iv1.awakeFromNib()
        iv2.awakeFromNib()
        
        // graphic context
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 1)
        let p = UIBezierPath(ovalIn: CGRect(x: 0,y: 0,width: 100,height: 100))
        UIColor.red.setFill()
        p.fill()
        
        let cimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let iv3 = UIImageView(image: cimage)
        iv3.backgroundColor = UIColor.clear
        iv3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv3)
        
        NSLayoutConstraint.activate([
                iv3.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -10),
                iv3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -50)
            ])
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 1)
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(UIColor(red: 0, green: 1, blue: 1, alpha: 0).cgColor)
        ctx?.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
        
        ctx?.addEllipse(in: CGRect(x: 0,y: 0,width: 100,height: 100))
        ctx?.setFillColor(UIColor.black.cgColor)
        ctx?.fillPath()
        
        let yimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let iv4 = UIImageView(image: yimage)
        iv4.backgroundColor = UIColor.clear
        iv4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv4)
        
        NSLayoutConstraint.activate([
                iv4.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: -10),
                iv4.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 50)
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
