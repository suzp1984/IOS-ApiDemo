//
//  SimpleTableViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/27/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SimpleTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "Simple Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Simple Table"
        let table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.cyan
        
        self.view.addSubview(table)
        self.navigationItem.leftItemsSupplementBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style:.default, reuseIdentifier:cellIdentifier)
            
            cell.textLabel!.textColor = UIColor.white
            let v = UIImageView()
            v.contentMode = .scaleToFill
            v.image = UIImage(named: "linen.png")
            cell.backgroundView = v
            let v2 = UIView()
            v2.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            cell.selectedBackgroundView = v2
            cell.backgroundColor = UIColor.red
        }
        
        cell.textLabel!.text = "Hello There! \((indexPath as NSIndexPath).row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}
