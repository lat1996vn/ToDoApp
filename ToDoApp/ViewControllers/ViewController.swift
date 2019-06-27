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
    
    enum SectionType : Int{
        case Todo = 0
        case Complete
    }

    var todoList: [ToDoWork] = []
    
    var completedList: [ToDoWork] = []
 
    @IBAction func btnAddToDoWorkTapped(_ sender: Any) {
        performSegue(withIdentifier: "MainToAddItem", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == SectionType.Todo.rawValue {
            return todoList.count
        } else {
            return completedList.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == SectionType.Todo.rawValue {
            return "List"
        } else {
            return "Completed"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tbvToDoList.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? toDoWorkCell {
            if(indexPath.section == SectionType.Todo.rawValue){
                cell.configCell(toDoWork: todoList[indexPath.row])
            } else {
                cell.configCell(toDoWork: completedList[indexPath.row])
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.section == SectionType.Todo.rawValue) {
            performSegue(withIdentifier: "MainToItemDetail", sender: todoList[indexPath.row])
        }else{
            performSegue(withIdentifier: "MainToItemDetail", sender: completedList[indexPath.row])
        }
    }
    
    func refresh(){
        self.tbvToDoList.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToItemDetail" {
            if let destination = segue.destination as? ItemDetailVC {
                if let toDoWork = sender as? ToDoWork {
                    destination.toDoWork = toDoWork
                }
            }
        }
    }
    
    @IBAction func unwindToMainVC(_ sender: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
        if sender.identifier == "AddItemToMain" {
            if let addItemVC = sender.source as? AddItemVC {
                todoList.insert(addItemVC.toDoWork, at: 0)
            }
        }
        tbvToDoList.reloadData()
    }
    
    @IBAction func btnCheckBoxTapped(_ sender: UIButton) {
        if let cell = sender.superview?.superview as? toDoWorkCell {
            if let index = tbvToDoList.indexPath(for: cell) {
                if index.section == SectionType.Todo.rawValue {
                    todoList[index.row].isDone = true
                    todoList[index.row].completedDate = getCurrentDate()
                    completedList.insert(todoList[index.row], at: 0)
                    todoList.remove(at: index.row)
                }
            }
        }
        refresh()
        
    }
    
    func getCurrentDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
//        imgView.image = UIImage(named: "icon_list")
//        tbvToDoList.headerView(forSection: 0)?.addSubview(imgView)
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
