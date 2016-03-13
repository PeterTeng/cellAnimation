//
//  ViewController.swift
//  cellAnimation
//
//  Created by TENGDONGSHIH on 3/14/16.
//  Copyright © 2016 ToUTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {

    @IBOutlet weak var animationTableView: UITableView!
    
    var dataArray = [String]()
    
    override func viewWillAppear(animated: Bool) {
        for i in 1...100 {
            dataArray.append("cell \(i)")
        }
        print(dataArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        animationTableView.delegate = self
        animationTableView.dataSource = self
        
    }
    
    
    // 必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    // 必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    // 必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    // セルのアニメーション
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let slideInTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 15, 0)
        
        cell.layer.transform = slideInTransform
        
        UIView.animateWithDuration(0.3) { () -> Void in
            
            cell.layer.transform = CATransform3DIdentity
            
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

