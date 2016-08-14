//
//  PageViewSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/13/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PageViewSampleViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let btn = UIButton(type: .System)
        btn.setTitle("present PageView", forState: .Normal)
        btn.addTarget(self, action: #selector(PageViewSampleViewController.doPresent(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                btn.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                btn.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doPresent(sender: UIButton) {
        let pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageController.setViewControllers([SecondPresentViewController()], direction: .Forward, animated: true, completion: nil)
        pageController.dataSource = self
        
        
        self.presentViewController(pageController, animated: true, completion: nil)
    }
    
    func pageViewControllerSupportedInterfaceOrientations(pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return .Portrait
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController is SecondPresentViewController {
            return ThirdPresentViewController()
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController is ThirdPresentViewController {
            return SecondPresentViewController()
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        let page = pageViewController.viewControllers![0]
        
        if page is SecondPresentViewController {
            return 0
        } else if page is ThirdPresentViewController {
            return 1
        }
        
        return -1
    }

}
