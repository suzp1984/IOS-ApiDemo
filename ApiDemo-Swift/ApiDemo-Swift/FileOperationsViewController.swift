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

        self.view.backgroundColor = UIColor.white
        
        // text view
        let txt = UILabel()
        self.view.addSubview(txt)
        txt.adjustsFontSizeToFitWidth = true
        txt.textColor = UIColor.red
        txt.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txt)
        NSLayoutConstraint.activate([
                txt.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
                txt.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                txt.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
        self.txt = txt
        
        // button 
        let pathBtn = UIButton(type: .system)
        pathBtn.setTitle("Get Documents Path", for: UIControlState())
        pathBtn.addTarget(self, action: #selector(FileOperationsViewController.getDocumentPath(_:)), for: .touchUpInside)
        pathBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(pathBtn)
        NSLayoutConstraint.activate([
                pathBtn.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20),
                pathBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // button document url
        let urlBtn = UIButton(type: .system)
        urlBtn.setTitle("Get Documents Url", for: UIControlState())
        urlBtn.addTarget(self, action: #selector(FileOperationsViewController.getDocumentUrl(_:)), for: .touchUpInside)
        self.view.addSubview(urlBtn)
        urlBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                urlBtn.topAnchor.constraint(equalTo: pathBtn.bottomAnchor, constant: 20),
                urlBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // button get Application Support Url
        let getSupportUrlBtn = UIButton(type: .system)
        getSupportUrlBtn.setTitle("Get/Create Application Support Url", for: UIControlState())
        getSupportUrlBtn.addTarget(self, action: #selector(FileOperationsViewController.getApplicationSupportUrl(_:)), for: .touchUpInside)
        self.view.addSubview(getSupportUrlBtn)
        getSupportUrlBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                getSupportUrlBtn.topAnchor.constraint(equalTo: urlBtn.bottomAnchor, constant: 20),
                getSupportUrlBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // button create folder and file
        let folderCreateBtn = UIButton(type: .system)
        folderCreateBtn.setTitle("Create Folder and File", for: UIControlState())
        folderCreateBtn.addTarget(self, action: #selector(FileOperationsViewController.createFolderAndFile(_:)), for: .touchUpInside)
        self.view.addSubview(folderCreateBtn)
        folderCreateBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                folderCreateBtn.topAnchor.constraint(equalTo: getSupportUrlBtn.bottomAnchor, constant: 20),
                folderCreateBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // button get Content of Directory
        let directoryBtn = UIButton(type: .system)
        directoryBtn.setTitle("Get Content of Directory", for: UIControlState())
        directoryBtn.addTarget(self, action: #selector(FileOperationsViewController.getDirectoryContent(_:)), for: .touchUpInside)
        self.view.addSubview(directoryBtn)
        directoryBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                directoryBtn.topAnchor.constraint(equalTo: folderCreateBtn.bottomAnchor, constant: 20),
                directoryBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
        // button deep traversal of directory 
        let deepButton = UIButton(type: .system)
        deepButton.setTitle("Deep traversal of Directory", for: UIControlState())
        deepButton.addTarget(self, action: #selector(FileOperationsViewController.deepTraversalDirectory(_:)), for: .touchUpInside)
        deepButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(deepButton)
        NSLayoutConstraint.activate([
                deepButton.topAnchor.constraint(equalTo: directoryBtn.bottomAnchor, constant: 20),
                deepButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDocumentPath(_ sender: UIButton) {
        if let docs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last, let txt = self.txt {
            print(docs)
            txt.text = docs
        }
    }
    
    func getDocumentUrl(_ sender: UIButton) {
        do {
            let fm = FileManager()
            let docUrl = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(docUrl)
            if let txt = self.txt {
                txt.text = docUrl.absoluteString
            }
        } catch {
            print(error)
        }
    }
    
    func getApplicationSupportUrl(_ sender: UIButton) {
        do {
            let fm = FileManager()
            let support = try fm.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            print(support)
            if let txt = self.txt {
                txt.text = support.absoluteString
            }
        } catch {
            print(error)
        }
        
    }
    
    func createFolderAndFile(_ sender: UIButton) {
        do {
            let fm = FileManager()
            let docUrl = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let myFolder = docUrl.appendingPathComponent("MyFolder")
            try fm.createDirectory(at: myFolder, withIntermediateDirectories: true, attributes: nil)
            try "Hello World".write(to: myFolder.appendingPathComponent("file1.txt"), atomically: true, encoding: String.Encoding.utf8)
            try "Greeting world".write(to: myFolder.appendingPathComponent("file2.txt"), atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
    }
    
    func getDirectoryContent(_ sender: UIButton) {
        do {
            let fm = FileManager()
            let docUrl = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let arr = try fm.contentsOfDirectory(at: docUrl, includingPropertiesForKeys: nil, options: [])
            arr.forEach{
                print($0.lastPathComponent)
            }
        } catch {
            print(error)
        }
    }
    
    func deepTraversalDirectory(_ sender: UIButton) {
        do {
            let fm = FileManager()
            let docUrl = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let dir = fm.enumerator(at: docUrl, includingPropertiesForKeys: nil, options: [], errorHandler: nil)!
            for case let f as URL in dir where f.pathExtension == "txt" {
                print(f.lastPathComponent)
            }
        } catch {
            print(error)
        }
    }
}
