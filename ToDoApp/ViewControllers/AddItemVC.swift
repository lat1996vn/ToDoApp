//
//  AddItemVC.swift
//  ToDoApp
//
//  Created by TuanLA on 6/26/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {

    @IBOutlet weak var tfWorkTitle: UITextField!
    @IBOutlet weak var tvWorkDetail: UITextView!
    var toDoWork = ToDoWork()
    
    @IBAction func btnAddWork(_ sender: Any) {
        toDoWork.workTitle = tfWorkTitle.text!
        toDoWork.workDetail = tvWorkDetail.text
        toDoWork.createdDate = getCurrentDate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getCurrentDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    
}
