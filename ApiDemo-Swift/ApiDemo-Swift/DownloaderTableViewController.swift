//
//  DownloaderTableViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/2/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class DownloaderTableViewController: UITableViewController {

    let cellIdentifier = "downloader"
    
    lazy var configuration : NSURLSessionConfiguration = {
        let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        configuration.allowsCellularAccess = false
        configuration.URLCache = nil
        return configuration
    }()
    
    lazy var downloader : MyDownloader = {
        let downloader = MyDownloader(configuration: self.configuration)
        return downloader
    }()
    
    var model : [Model] = {
        let mannyurl = "https://www.apeth.com/pep/manny.jpg"
        let jackurl = "https://www.apeth.com/pep/jack.jpg"
        let moeurl = "https://www.apeth.com/pep/moe.jpg"
        var arr = [Model]()
        for _ in 0 ..< 15 {
            let m = Model()
            m.text = "Manny"
            m.picurl = mannyurl
            arr.append(m)
        }
        for _ in 0 ..< 15 {
            let m = Model()
            m.text = "Moe"
            m.picurl = moeurl
            arr.append(m)
        }
        for _ in 0 ..< 15 {
            let m = Model()
            m.text = "Jack"
            m.picurl = jackurl
            arr.append(m)
        }
        return arr
    }()

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
        return self.model.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let m = self.model[indexPath.row]
        cell.textLabel!.text = m.text
        // have we got a picture?
        if let im = m.im {
            cell.imageView!.image = im
        } else {
            if m.task == nil { // no task? start one!
                cell.imageView!.image = nil
                m.task = self.downloader.download(m.picurl) { // *
                    [weak self] url in // *
                    m.task = nil // *
                    if url == nil {
                        return
                    }
                    let data = NSData(contentsOfURL: url)!
                    let im = UIImage(data:data)
                    m.im = im
                    dispatch_async(dispatch_get_main_queue()) {
                        self!.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
                    }
                }
            }
        }

        return cell
    }

    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    deinit {
        self.downloader.cancelAllTasks()
        print("table view controller dealloc")
    }
    
}

class Model {
    var text : String!
    var im : UIImage!
    var picurl : String!
    var task : NSURLSessionTask!
}