//
//  CustomeCellLayoutViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/27/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class CustomeCellLayoutViewController: UITableViewController {

    let cellIdentifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(MyCell.self, forCellReuseIdentifier: cellIdentifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyCell

        if cell.textLabel!.numberOfLines != 2 { // never previously configured
            cell.textLabel!.font = UIFont(name:"Helvetica-Bold", size:16)
            cell.textLabel!.lineBreakMode = .byWordWrapping
            cell.textLabel!.numberOfLines = 2
            // next line fails, I regard this as a bug
            // cell.separatorInset = UIEdgeInsetsMake(0,0,0,0)
        }
        
        cell.textLabel!.text = "The author of this book, who would rather be out dirt biking"
        
        // shrink apparent size of image
        let im = UIImage(named:"Moi")!
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 36,height: 36), true, 0.0)
        im.draw(in: CGRect(x: 0,y: 0,width: 36,height: 36))
        let im2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        cell.imageView!.image = im2
        cell.imageView!.contentMode = .center


        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
