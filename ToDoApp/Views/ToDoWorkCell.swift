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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func checkBoxIsDoneTapped(_ sender: UIButton) {
        if checkBoxIsDone.isSelected == true {
            checkBoxIsDone.isSelected = false
        } else {
            checkBoxIsDone.isSelected = true
        }
    }
    
    func configCell(toDoWork: ToDoWork) {
        lblCreatedDate.text = toDoWork.createdDate
        lblWorkDetail.text = toDoWork.workTitle
        if toDoWork.isDone {
            checkBoxIsDone.isSelected = true
        }
        else {
            checkBoxIsDone.isSelected = false
        }
    }

}
