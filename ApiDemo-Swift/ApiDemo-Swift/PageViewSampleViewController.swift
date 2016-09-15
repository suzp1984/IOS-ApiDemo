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

        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton(type: .system)
        btn.setTitle("present PageView", for: UIControlState())
        btn.addTarget(self, action: #selector(PageViewSampleViewController.doPresent(_:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doPresent(_ sender: UIButton) {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.setViewControllers([SecondPresentViewController()], direction: .forward, animated: true, completion: nil)
        pageController.dataSource = self
        
        
        self.present(pageController, animated: true, completion: nil)
    }
    
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return .portrait
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if viewController is SecondPresentViewController {
            return ThirdPresentViewController()
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if viewController is ThirdPresentViewController {
            return SecondPresentViewController()
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        let page = pageViewController.viewControllers![0]
        
        if page is SecondPresentViewController {
            return 0
        } else if page is ThirdPresentViewController {
            return 1
        }
        
        return -1
    }

}
