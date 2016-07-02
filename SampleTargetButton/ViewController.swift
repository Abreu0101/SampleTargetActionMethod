//
//  ViewController.swift
//  SampleTargetButton
//
//  Created by Roberto Abreu on 2/7/16.
//  Copyright © 2016 homeappz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    @IBOutlet var yourTbl: UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! MyCustomTableViewCell
        
        cell.myBtn.addTarget(self, action: "myActionMethod:", forControlEvents: .TouchUpInside)
        cell.myBtn.setTitle("Button \(indexPath.row)", forState: .Normal)
        
        return cell
    }
    
    //MARK: myActionMethod
    
    func myActionMethod(sender:UIButton){
        if let tableViewCell = sender.superview?.superview as? UITableViewCell, indexPath = yourTbl.indexPathForCell(tableViewCell){
            let alert = UIAlertController(title: "Touch", message: "The button with section \(indexPath.section) and row \(indexPath.row) was tapped", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
}

