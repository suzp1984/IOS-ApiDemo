//
//  CustomContentViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/27/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class CustomContentViewController: UITableViewController {

    let cellIdentifier = "custome content"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
        self.tableView.rowHeight = 58
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        if cell.viewWithTag(1) == nil {
            let iv = UIImageView()
            iv.tag = 1
            cell.contentView.addSubview(iv)
            let lab = UILabel()
            lab.tag = 2
            cell.contentView.addSubview(lab)
            iv.translatesAutoresizingMaskIntoConstraints = false
            lab.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activateConstraints([
                iv.centerYAnchor.constraintEqualToAnchor(cell.contentView.centerYAnchor),
                iv.widthAnchor.constraintEqualToAnchor(iv.heightAnchor),
                lab.topAnchor.constraintEqualToAnchor(cell.contentView.topAnchor),
                lab.bottomAnchor.constraintEqualToAnchor(cell.contentView.bottomAnchor),
                lab.leftAnchor.constraintEqualToAnchor(cell.contentView.leftAnchor, constant: 15),
                iv.leftAnchor.constraintEqualToAnchor(lab.rightAnchor, constant: 15),
                iv.rightAnchor.constraintEqualToAnchor(cell.contentView.rightAnchor, constant: -15)
                ])
            
            lab.font = UIFont(name:"Helvetica-Bold", size:16)
            lab.lineBreakMode = .ByWordWrapping
            lab.numberOfLines = 2
        }
        
        let lab = cell.viewWithTag(2) as! UILabel
        let iv  = cell.viewWithTag(1) as! UIImageView
        
        lab.text = "The author of this book, who would rather be out dirt biking"
        
        // shrink apparent size of image
        let im = UIImage(named:"Moi")!
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36,36), true, 0.0)
        im.drawInRect(CGRectMake(0,0,36,36))
        let im2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        iv.image = im2
        iv.contentMode = .Center
        
        return cell
    }

}
