//
//  NoteTableViewController.swift
//  KIM_Note_FP
//
//  Created by S@i on 2020-06-27.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import CoreData

class NoteTableViewController: UITableViewController,UISearchBarDelegate,UISearchDisplayDelegate {

     var seleInd = -1
    
    @IBOutlet var tblview: UITableView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    var notes:[Note] = []
    var sort = true
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        getNotes()
        tblview.reloadData()
       
    }
    
   
    

     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
         getNotes()
         tblview.reloadData()
     }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return notes.count
       }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTVC", for: indexPath) as! NoteTVC

           let note: Note = notes[indexPath.row]
           cell.configureCell(note: note)
      
        
           
           
           return cell
       }

       
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           if editingStyle == .delete {
            let alert = UIAlertController(title: "Alert", message: "Do you want to Delete it?", preferredStyle: .alert)
                       let addAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                        let dele = self.notes[indexPath.row]
                          context.delete(dele)
                          (UIApplication.shared.delegate as! AppDelegate).saveContext()
                          do
                          {
                            self.notes = try context.fetch(Note.fetchRequest())
                          }
                          catch
                          {
                              print(error)
                          }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(addAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
           }
           
           tblview.reloadData()
           
       }
       
      
    @IBAction func btnSort(_ sender: Any) {
        if sort == true{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
            let descr = NSSortDescriptor(key: #keyPath(Note.noteName), ascending: true)
            fetchRequest.sortDescriptors = [descr]
            do{
                notes = try context.fetch(fetchRequest)
                
            }catch{
                print(error)
            }
            sort = false
            tblview.reloadData()
        }
        else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
            let descr = NSSortDescriptor(key: #keyPath(Note.noteDate), ascending: false)
            fetchRequest.sortDescriptors = [descr]
            
            do{
                notes = try context.fetch(fetchRequest)
                
            }catch{
                print(error)
            }
            sort = true
            tblview.reloadData()
        }
    }
    
    func getNotes() {
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
      do{
          notes = try context.fetch(Note.fetchRequest())
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
            let descr = NSSortDescriptor(key: #keyPath(Note.noteDate), ascending: false)
            fetchRequest.sortDescriptors = [descr]
            
            do{
                notes = try context.fetch(fetchRequest)
            }catch{
                print(error)
            }
        tblview.reloadData()
      }catch{
          print(error)
      }
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String)
       {
           if searchText != ""
           {
               var predicate: NSPredicate = NSPredicate()
               predicate = NSPredicate(format: "Title contains[c] '\(searchText)'")
       
               let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
               let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
               fetchRequest.predicate = predicate
               
               do
               {
                   notes = try context.fetch(fetchRequest) as! [NSManagedObject] as! [Note]
               }
               catch{
                   print(error)
               }
           }
           else{
            viewDidLoad()
        }
           tableView.reloadData()
       }
    @IBAction func addNote(_ sender: Any) {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddNoteVC") as! AddNoteVC
               
               self.present(obj, animated: true, completion: nil)
              //  self.navigationController?.pushViewController(obj, animated: true)
    }
    
    
  
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        

    }
}

