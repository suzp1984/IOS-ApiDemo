
import UIKit

class DrawingIntoLayerViewController: UIViewController {
    
    var views = [UIView]()
    var smilers = [Smiler(), Smiler2()]
    
    var layer0 : CALayer!
    var layer1 : CALayer!
    
    func makeLayerOfClass(_ klass:CALayer.Type, andAddToView ix:Int) -> CALayer {
        let lay = klass.init()
        lay.contentsScale = UIScreen.main.scale
        //    lay.contentsGravity = kCAGravityBottom
        //    lay.contentsRect = CGRectMake(0.2,0.2,0.5,0.5)
        //    lay.contentsCenter = CGRectMake(0.0, 0.4, 1.0, 0.6)
        let v = (self.views as [UIView])[ix]
        lay.frame = v.layer.bounds
        v.layer.addSublayer(lay)
        lay.setNeedsDisplay()
        
        // add another layer to say which view this is
        
        let tlay = CATextLayer()
        tlay.frame = lay.bounds
        lay.addSublayer(tlay)
        tlay.string = "\(ix)"
        tlay.fontSize = 30
        tlay.alignmentMode = kCAAlignmentCenter
        tlay.foregroundColor = UIColor.green.cgColor
        
        return lay;
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        let v1 = UIView()
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v1.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let v2 = UIView()
        v2.translatesAutoresizingMaskIntoConstraints = false
        v2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v2.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let v3 = UIView()
        v3.translatesAutoresizingMaskIntoConstraints = false
        v3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v3.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let v4 = UIView()
        v4.translatesAutoresizingMaskIntoConstraints = false
        v4.widthAnchor.constraint(equalToConstant: 100).isActive = true
        v4.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.view.addSubview(v1)
        self.view.addSubview(v2)
        self.view.addSubview(v3)
        self.view.addSubview(v4)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v1]-(>=5)-[v2]-20-|", options: [], metrics: nil, views: ["v1": v1, "v2": v2]),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v3]-(>=5)-[v4]-20-|", options: [], metrics: nil, views: ["v3": v3, "v4": v4]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-10-[v1]-(>=5)-[v3]-10-[blg]|", options: [], metrics: nil, views: ["tlg":self.topLayoutGuide, "v1": v1, "v3": v3, "blg":self.bottomLayoutGuide]),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[tlg]-10-[v2]-(>=5)-[v4]-10-[blg]|", options: [], metrics: nil, views: ["tlg":self.topLayoutGuide, "v2": v2, "v4": v4, "blg":self.bottomLayoutGuide])
            ].flatMap{$0})
        
        self.views = [v1, v2, v3, v4]
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // four ways of getting content into a layer
        
        // 0: delegate draws
        self.layer0 = self.makeLayerOfClass(CALayer.self, andAddToView:0)
        self.layer0.delegate = self.smilers[0] as! CALayerDelegate
        // 1: delegate sets contents
        self.layer1 = self.makeLayerOfClass(CALayer.self, andAddToView:1)
        self.layer1.delegate = self.smilers[1] as! CALayerDelegate
        
        // 2: subclass draws
        self.makeLayerOfClass(SmilerLayer.self, andAddToView:2)
        // 3: subclass sets contents
        self.makeLayerOfClass(SmilerLayer2.self, andAddToView:3)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.layer0.delegate = nil
        self.layer1.delegate = nil
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
