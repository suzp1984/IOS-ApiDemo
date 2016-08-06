//
//  PageControlViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController {

    let demos = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let pageControl = UIPageControl()
        pageControl.numberOfPages = demos.count
        pageControl.currentPage = 3
        pageControl.tintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.blackColor()
        pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                pageControl.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor, constant: -20),
                pageControl.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                pageControl.widthAnchor.constraintEqualToConstant(150),
                pageControl.heightAnchor.constraintEqualToConstant(50)
            ])
        
//        let scroll = UIScrollView()
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(scroll)
//        scroll.pagingEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
