//
//  ViewController.swift
//  ToDoApp
//
//  Created by TuanLA on 6/25/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tbvToDoList: UITableView!

    var todoList: [ToDoWork] = []
    
    var completedList: [ToDoWork] = []
 
    @IBAction func btnAddToDoWorkTapped(_ sender: Any) {
        performSegue(withIdentifier: "MainToAddItem", sender: nil)
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tbvToDoList.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? toDoWorkCell {
        cell.configCell(toDoWork: todoList[indexPath.row])
        return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "MainToItemDetail", sender: todoList[indexPath.row])
    }
    
    func refresh(){
        print("refreshed")
        self.tbvToDoList.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToItemDetail" {
            if let destination = segue.destination as? ItemDetailVC {
                if let toDoWork = sender as? ToDoWork {
                    print("Pass1")
                    destination.toDoWork = toDoWork
                }
            }
        }
    }
    
    @IBAction func unwindToMainVC(_ sender: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
        if sender.identifier == "AddItemToMain" {
            if let addItemVC = sender.source as? AddItemVC {
                print("SAVE")
                todoList.insert(addItemVC.toDoWork, at: 0)
            }
        }
        tbvToDoList.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}





//    func showInputDialog() {
//        //Creating UIAlertController and
//        //Setting title and message for the alert dialog
//        let alertController = UIAlertController(title: "Add ToDo Item", message: nil, preferredStyle: .alert)
//
//        //the confirm action taking the inputs
//        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
//
//            //getting the input values from user
//            let workDetail = alertController.textFields?[0].text
//
//            self.todoList.insert((ToDoWork(createDate: self.getCurrentDate(), workTitle: "", workDetail: workDetail ?? "")), at: 0)
//            self.refresh()
//
//        }
//
//        //the cancel action doing nothing
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
//
//        //adding textfields to our dialog box
//        alertController.addTextField { (textField) in
//            textField.placeholder = "Enter Work Detail"
//        }
//
//        alertController.addAction(confirmAction)
//        alertController.addAction(cancelAction)
//
//        //finally presenting the dialog box
//        self.present(alertController, animated: true, completion: nil)
//    }
