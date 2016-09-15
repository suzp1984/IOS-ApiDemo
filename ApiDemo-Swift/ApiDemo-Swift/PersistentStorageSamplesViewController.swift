//
//  PersistentStorageSamplesViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PersistentStorageSamplesViewController: UIViewController, UINavigationControllerDelegate,
                                            UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "Storage"
    let demos: [String] = ["file operation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Storage"
        let table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.cyan
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
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
        return demos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if cell == nil {
            cell = UITableViewCell(style:.default, reuseIdentifier:cellIdentifier)
            
            cell.textLabel!.textColor = UIColor.white
            
            let v2 = UIView() // no need to set frame
            v2.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            cell.selectedBackgroundView = v2
            
            // next line didn't work until iOS 7!
            cell.backgroundColor = UIColor.red
        }
        
        let v2 = UIView() // no need to set frame
        v2.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        cell.selectedBackgroundView = v2
        
        cell.textLabel!.textColor = UIColor.white
        cell.backgroundColor = UIColor.red
        cell.textLabel!.text = demos[(indexPath as NSIndexPath).row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch demos[(indexPath as NSIndexPath).row] {
        case demos[0]:
            self.navigationController?.pushViewController(FileOperationsViewController(), animated: true)
        default:
            break
        }
    }

}
