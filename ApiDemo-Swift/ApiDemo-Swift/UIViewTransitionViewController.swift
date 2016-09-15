
import UIKit

class UIViewTransitionViewController: UIViewController {

    var iv : UIImageView!
    var rv : MyReverseView!
    var outer : UIView!
    var inner : UIView!
    var lab : UILabel!
    var reverse : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        iv = UIImageView(image: UIImage(named: "Mars"))
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        iv.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        iv.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        let button = UIButton(type: .system)
        button.setTitle("Transite", for: UIControlState())
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        button.addTarget(self, action: #selector(UIViewTransitionViewController.animate), for: .touchUpInside)
        
        rv = MyReverseView()
        self.view.addSubview(rv)
        rv.backgroundColor = UIColor.purple
        rv.translatesAutoresizingMaskIntoConstraints = false
        rv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rv.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        rv.topAnchor.constraint(equalTo: self.iv.bottomAnchor, constant: 20).isActive = true
        
        outer = UIView()
        outer.backgroundColor = UIColor.blue
        self.view.addSubview(outer)
        outer.translatesAutoresizingMaskIntoConstraints = false
        outer.widthAnchor.constraint(equalToConstant: 150).isActive = true
        outer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        outer.topAnchor.constraint(equalTo: self.rv.bottomAnchor, constant: 20).isActive = true
        outer.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        inner = UIView()
        inner.backgroundColor = UIColor.red
        self.outer.addSubview(inner)
        inner.translatesAutoresizingMaskIntoConstraints = false
        inner.widthAnchor.constraint(equalToConstant: 40).isActive = true
        inner.heightAnchor.constraint(equalToConstant: 80).isActive = true
        inner.leftAnchor.constraint(equalTo: self.outer.leftAnchor).isActive = true
        inner.topAnchor.constraint(equalTo: self.outer.topAnchor, constant: 10).isActive = true
    
        lab = UILabel()
        lab.text = "Hello"
        lab.sizeToFit()
        
        self.view.addSubview(lab)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        lab.topAnchor.constraint(equalTo: self.outer.bottomAnchor, constant: 10).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animate() -> Void {
        let opts : UIViewAnimationOptions = .transitionFlipFromLeft
        UIView.transition(with: self.iv, duration: 2.0, options: opts, animations: {
                if (self.reverse) {
                    self.iv.image = UIImage(named: "Mars")
                } else {
                    self.iv.image = UIImage(named: "Moi")
                }
            
                self.reverse = !self.reverse
            }, completion: nil)
        
        UIView.transition(with: self.rv, duration: 2.0, options: opts, animations: {
                self.rv.setNeedsDisplay()
            }, completion: nil)
        
        let opts2 : UIViewAnimationOptions = [.allowAnimatedContent]
        UIView.transition(with: self.outer, duration: 2.0, options: opts2, animations: {
                var f = self.inner.frame
                if (f.size.width == self.outer.frame.width) {
                    f.size.width = 40
                } else {
                    f.size.width = self.outer.frame.width
                }
                f.origin.x = 0
                self.inner.frame = f
            }, completion: nil)
        
//        let lab2 = UILabel(frame: self.lab.frame)
//        lab2.text = self.lab.text == "Hello" ? "Howdy" : "Hello"
//        // lab2.sizeToFit()
//        
//        UIView.transitionFromView(self.lab, toView: lab2, duration: 2.0, options: .TransitionFlipFromLeft, completion: {
//            _ in
//            self.lab = lab2
//        })
    }
}
