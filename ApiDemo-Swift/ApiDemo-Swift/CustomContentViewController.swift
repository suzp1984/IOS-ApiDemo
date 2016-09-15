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
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
        self.tableView.rowHeight = 58
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        if cell.viewWithTag(1) == nil {
            let iv = UIImageView()
            iv.tag = 1
            cell.contentView.addSubview(iv)
            let lab = UILabel()
            lab.tag = 2
            cell.contentView.addSubview(lab)
            iv.translatesAutoresizingMaskIntoConstraints = false
            lab.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                iv.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                iv.widthAnchor.constraint(equalTo: iv.heightAnchor),
                lab.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                lab.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                lab.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor, constant: 15),
                iv.leftAnchor.constraint(equalTo: lab.rightAnchor, constant: 15),
                iv.rightAnchor.constraint(equalTo: cell.contentView.rightAnchor, constant: -15)
                ])
            
            lab.font = UIFont(name:"Helvetica-Bold", size:16)
            lab.lineBreakMode = .byWordWrapping
            lab.numberOfLines = 2
        }
        
        let lab = cell.viewWithTag(2) as! UILabel
        let iv  = cell.viewWithTag(1) as! UIImageView
        
        lab.text = "The author of this book, who would rather be out dirt biking"
        
        // shrink apparent size of image
        let im = UIImage(named:"Moi")!
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 36,height: 36), true, 0.0)
        im.draw(in: CGRect(x: 0,y: 0,width: 36,height: 36))
        let im2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        iv.image = im2
        iv.contentMode = .center
        
        return cell
    }

}
