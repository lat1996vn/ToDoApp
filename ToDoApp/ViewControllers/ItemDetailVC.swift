//
//  ItemDetailVC.swift
//  ToDoApp
//
//  Created by TuanLA on 6/26/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController {

    var toDoWork: ToDoWork!
    
    @IBOutlet weak var tfWorkTitle: UITextField!
    @IBOutlet weak var tvWorkDetail: UITextView!
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        toDoWork.workTitle = tfWorkTitle.text!
        toDoWork.workDetail = tvWorkDetail.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataToScreen()
    }
    
    func loadDataToScreen() {
        tfWorkTitle.text = toDoWork.workTitle
        tvWorkDetail.text = toDoWork.workDetail
    }
}
