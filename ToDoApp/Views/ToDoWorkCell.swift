//
//  toDoWorkCell.swift
//  ToDoApp
//
//  Created by TuanLA on 6/25/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class toDoWorkCell: UITableViewCell {

    @IBOutlet weak var lblCreatedDate: UILabel!
    @IBOutlet weak var lblWorkDetail: UILabel!
    @IBOutlet weak var checkBoxIsDone: UIButton!
    @IBOutlet weak var lblCompletedDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func checkBoxIsDoneTapped(_ sender: UIButton) {

    }
    
    func configCell(toDoWork: ToDoWork) {
//        print("reloadcell")
//        print(toDoWork.workTitle)
//        print(toDoWork.workDetail)
//        print(toDoWork.createdDate)
//        print(toDoWork.isDone)
        lblCreatedDate.text = toDoWork.createdDate
        lblWorkDetail.text = toDoWork.workTitle
        if toDoWork.isDone {
            checkBoxIsDone.isHidden = true
            lblCompletedDate.isHidden = false
            lblCompletedDate.text = toDoWork.completedDate
        } else {
            checkBoxIsDone.isHidden = false
            lblCompletedDate.isHidden = true
        }
    }

}
