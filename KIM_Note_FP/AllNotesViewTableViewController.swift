//
//  ViewController.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-12.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class AllNotesViewTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notebook.refreshData()
    
        //adding an edit bar button
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Test Code Only
        return notebook.size()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // #warning Test Code Only
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath as IndexPath) as! NoteTableViewCell
        
        // Configure the cell...
        let note = notebook.getNote(indexPath.row)
        cell.noteNameLabel.text = note.title
        cell.noteLastEditDateLabel.text = note.lastEditDate()
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notebook.removeNote(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Notes"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        
        
        if segue.identifier == "compose" {
            let vc = segue.destinationViewController as! NoteEditViewController
            vc.newNote = true
            //tvc.viewDidLoad()
        }
 
        if segue.identifier == "edit" {
            let vc = segue.destinationViewController as! NoteEditViewController
            vc.newNote = false
            vc.currentNote = notebook.getNote((self.tableView.indexPathForSelectedRow?.row)!)
            //vc.viewDidLoad()
        }
    }
    
}
