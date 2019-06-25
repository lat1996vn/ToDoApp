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
    
    func getPlist(withName name: String) -> [String]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }
        
        return nil
    }

    var todoList: [ToDoWork] = []
 
    @IBAction func btnAddToDoWorkTapped(_ sender: Any) {
        showInputDialog()
    }
    
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
    
    
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Add ToDo Item", message: nil, preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            
            //getting the input values from user
            let workDetail = alertController.textFields?[0].text
            
            self.todoList.insert((ToDoWork(createDate: "26/06", workDetail: workDetail ?? "")), at: 0)
            for item in self.todoList {
                print(item.createdDate)
                print(item.workDetail)
                print(item.isDone)
            }
            self.refresh()
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Work Detail"
        }

        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    func refresh(){
        print("refreshed")
        self.tbvToDoList.reloadData()
    }
    
//    func saveData(data: [ToDoWork]) {
//        let encoder = PropertyListEncoder()
//        encoder.outputFormat = .xml
//        
//        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("ToDoList.plist")
//        for item in data {
//            do {
//                let data = try encoder.encode("\(item.createdDate) \(item.workDetail) \(item.isDone)\n")
//                try data.write(to: path)
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let list = getPlist(withName: "ToDoList") {
//            //todoList = list
//        }
        // Do any additional setup after loading the view.
    }


}

