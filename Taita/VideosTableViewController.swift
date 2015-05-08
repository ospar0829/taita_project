//
//  VideosTableViewController.swift
//  Taita
//
//  Created by Javier Guaje on 5/7/15.
//  Copyright (c) 2015 Catania Tech. All rights reserved.
//

import UIKit

class VideosTableViewController: UITableViewController {
    
    private let idVideoCell = "idVideoCell"
    
    var videosBarButtonItem: UIBarButtonItem!
    
    var category = "Cuentos, Mitos y Leyendas"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // self.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        // self.navigationItem.leftItemsSupplementBackButton = true
        
        videosBarButtonItem = UIBarButtonItem(title: "Categoria", style: UIBarButtonItemStyle.Plain, target: self, action: "showCategoriesViewController")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleFirstViewControllerDisplayModeChangeWithNotification:"), name: "PrimaryVCDisplayModeChangeNotification", object: nil)
        
        title = category
    }
    
    func showTutorialsViewController() {
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        toolbarItems?.insert(self.splitViewController!.displayModeButtonItem(), atIndex: 0)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleFirstViewControllerDisplayModeChangeWithNotification(notification: NSNotification){
        let displayModeObject = notification.object as? NSNumber
        let nextDisplayMode = displayModeObject?.integerValue
        
        if toolbarItems?.count == 3 {
            toolbarItems?.removeAtIndex(0)
        }
        
        if nextDisplayMode == UISplitViewControllerDisplayMode.AllVisible.rawValue {
            toolbarItems?.insert(videosBarButtonItem, atIndex: 0)
        } else {
            toolbarItems?.insert(splitViewController!.displayModeButtonItem(), atIndex: 0)
        }
    }

    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(idVideoCell, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let video = videos[indexPath.row]
        cell.textLabel?.text = video

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
