//
//  TableViewController.swift
//  CellButtons
//
//  Created by Jure Zove on 20/09/15.
//  Copyright © 2015 Candy Code. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ButtonCellDelegate {

    var expandedRow: NSIndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 99
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return expandedRow == indexPath ? 100 : 44
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell

        cell.rowLabel.text = "\(indexPath.row)"
        if cell.buttonDelegate == nil {
            cell.buttonDelegate = self
        }

        return cell
    }
    
    // MARK: - ButtonCellDelegate
    
    func cellTapped(cell: ButtonCell) {
      let indexPath = tableView.indexPathForCell(cell)
      if indexPath == expandedRow {
        expandedRow = nil
      } else {
        expandedRow = indexPath
      }
      tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
    }

}
