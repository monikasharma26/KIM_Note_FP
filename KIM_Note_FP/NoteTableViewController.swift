//
//  ViewController.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-12.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
        
@IBOutlet weak var trashBtn: UIBarButtonItem!
@IBOutlet weak var moveToBtn: UIBarButtonItem!

var notes = [Note]()
var selectedFolder: Folder? {
    didSet {
        loadNotes()
    }
}

// create a context
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

override func viewDidLoad() {
    super.viewDidLoad()

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
}

func loadNotes() {
    let request: NSFetchRequest<Note> = Note.fetchRequest()
    let folderPredicate = NSPredicate(format: "parentFolder.name=%@", selectedFolder!.name!)
    request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
    request.predicate = folderPredicate
    
    do {
        notes = try context.fetch(request)
    } catch {
        print("Error loading notes \(error.localizedDescription)")
    }
}

// MARK: - Table view data source
override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return notes.count
}


override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
    let note = notes[indexPath.row]
    cell.textLabel?.text = note.title
    return cell
}
}
