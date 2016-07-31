//
//  FileOperationsViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class FileOperationsViewController: UIViewController {

    var txt : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        // text view
        let txt = UILabel()
        self.view.addSubview(txt)
        txt.adjustsFontSizeToFitWidth = true
        txt.textColor = UIColor.redColor()
        txt.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txt)
        NSLayoutConstraint.activateConstraints([
                txt.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: -10),
                txt.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                txt.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor)
            ])
        self.txt = txt
        
        // button 
        let pathBtn = UIButton(type: .System)
        pathBtn.setTitle("Get Documents Path", forState: .Normal)
        pathBtn.addTarget(self, action: #selector(FileOperationsViewController.getDocumentPath(_:)), forControlEvents: .TouchUpInside)
        pathBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(pathBtn)
        NSLayoutConstraint.activateConstraints([
                pathBtn.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                pathBtn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // button document url
        let urlBtn = UIButton(type: .System)
        urlBtn.setTitle("Get Documents Url", forState: .Normal)
        urlBtn.addTarget(self, action: #selector(FileOperationsViewController.getDocumentUrl(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(urlBtn)
        urlBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                urlBtn.topAnchor.constraintEqualToAnchor(pathBtn.bottomAnchor, constant: 20),
                urlBtn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // button get Application Support Url
        let getSupportUrlBtn = UIButton(type: .System)
        getSupportUrlBtn.setTitle("Get/Create Application Support Url", forState: .Normal)
        getSupportUrlBtn.addTarget(self, action: #selector(FileOperationsViewController.getApplicationSupportUrl(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(getSupportUrlBtn)
        getSupportUrlBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                getSupportUrlBtn.topAnchor.constraintEqualToAnchor(urlBtn.bottomAnchor, constant: 20),
                getSupportUrlBtn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // button create folder and file
        let folderCreateBtn = UIButton(type: .System)
        folderCreateBtn.setTitle("Create Folder and File", forState: .Normal)
        folderCreateBtn.addTarget(self, action: #selector(FileOperationsViewController.createFolderAndFile(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(folderCreateBtn)
        folderCreateBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                folderCreateBtn.topAnchor.constraintEqualToAnchor(getSupportUrlBtn.bottomAnchor, constant: 20),
                folderCreateBtn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // button get Content of Directory
        let directoryBtn = UIButton(type: .System)
        directoryBtn.setTitle("Get Content of Directory", forState: .Normal)
        directoryBtn.addTarget(self, action: #selector(FileOperationsViewController.getDirectoryContent(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(directoryBtn)
        directoryBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                directoryBtn.topAnchor.constraintEqualToAnchor(folderCreateBtn.bottomAnchor, constant: 20),
                directoryBtn.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // button deep traversal of directory 
        let deepButton = UIButton(type: .System)
        deepButton.setTitle("Deep traversal of Directory", forState: .Normal)
        deepButton.addTarget(self, action: #selector(FileOperationsViewController.deepTraversalDirectory(_:)), forControlEvents: .TouchUpInside)
        deepButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(deepButton)
        NSLayoutConstraint.activateConstraints([
                deepButton.topAnchor.constraintEqualToAnchor(directoryBtn.bottomAnchor, constant: 20),
                deepButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDocumentPath(sender: UIButton) {
        if let docs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last, txt = self.txt {
            print(docs)
            txt.text = docs
        }
    }
    
    func getDocumentUrl(sender: UIButton) {
        do {
            let fm = NSFileManager()
            let docUrl = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            print(docUrl)
            if let txt = self.txt {
                txt.text = docUrl.absoluteString
            }
        } catch {
            print(error)
        }
    }
    
    func getApplicationSupportUrl(sender: UIButton) {
        do {
            let fm = NSFileManager()
            let support = try fm.URLForDirectory(.ApplicationSupportDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
            print(support)
            if let txt = self.txt {
                txt.text = support.absoluteString
            }
        } catch {
            print(error)
        }
        
    }
    
    func createFolderAndFile(sender: UIButton) {
        do {
            let fm = NSFileManager()
            let docUrl = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            let myFolder = docUrl.URLByAppendingPathComponent("MyFolder")
            try fm.createDirectoryAtURL(myFolder, withIntermediateDirectories: true, attributes: nil)
            try "Hello World".writeToURL(myFolder.URLByAppendingPathComponent("file1.txt"), atomically: true, encoding: NSUTF8StringEncoding)
            try "Greeting world".writeToURL(myFolder.URLByAppendingPathComponent("file2.txt"), atomically: true, encoding: NSUTF8StringEncoding)
        } catch {
            print(error)
        }
    }
    
    func getDirectoryContent(sender: UIButton) {
        do {
            let fm = NSFileManager()
            let docUrl = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            let arr = try fm.contentsOfDirectoryAtURL(docUrl, includingPropertiesForKeys: nil, options: [])
            arr.forEach{
                print($0.lastPathComponent!)
            }
        } catch {
            print(error)
        }
    }
    
    func deepTraversalDirectory(sender: UIButton) {
        do {
            let fm = NSFileManager()
            let docUrl = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            let dir = fm.enumeratorAtURL(docUrl, includingPropertiesForKeys: nil, options: [], errorHandler: nil)!
            for case let f as NSURL in dir where f.pathExtension == "txt" {
                print(f.lastPathComponent!)
            }
        } catch {
            print(error)
        }
    }
}
