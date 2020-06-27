//
//  NoteListVC.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-27.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import CoreData
class NoteListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
 @IBOutlet var tblview: UITableView!
 
 @IBOutlet weak var searchbar: UISearchBar!
    var notes:[Note] = []
    override func viewDidLoad() {
        super.viewDidLoad()

     super.viewDidLoad()
         searchbar.delegate = self
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
                tap.cancelsTouchesInView = false
         tblview.addGestureRecognizer(tap)
        tblview.rowHeight = 150
         view.addGestureRecognizer(tap)
         self.tblview.delegate = self
         self.tblview.dataSource = self
        // register to receive notification...
               NotificationCenter.default.addObserver(self, selector: #selector(NoteListVC.refresh), name:  Notification.Name("NOTELISTREFRESH"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddNoteVC") as! AddNoteVC
                      self.present(obj, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTVC", for: indexPath) as! NoteTVC
                  let note: Note = notes[indexPath.row]
                  cell.configureCell(note: note)
             return cell
    }
    var inAsec = true
    func update(index:Int)
    {
        if(index == 0 && inAsec)
        {
            notes.reverse()
            inAsec = false
            tblview.reloadData()
        }
        else if(index == 1 && !inAsec)
        {
            notes.reverse()
            inAsec = true
            tblview.reloadData()
        }
    }
    @IBAction func btnSort(_ sender: Any) {
    }
    @objc func refresh() {
           //
           tblview.reloadData()
       }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
                          let context = appdelegate.persistentContainer.viewContext
                        
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
            
            do
            {
                let x = try context.fetch(fetchRequest)
                let result = x as! [Note]
                
               
                context.delete(result[indexPath.row])
                print(indexPath.row )
                do
                {
                   try context.save()
                }
                catch{
                }
                notes.remove(at: indexPath.row)
                self.tblview.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                
            }
            catch
            {
                
            }
        }
    }
    

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
               do
               {
                let x = try context.fetch(fetchRequest) as! [Note]
                notes = x
                self.tblview.reloadData()
                
               }
               catch
               {
               }
        self.refresh()
    }
    
}
