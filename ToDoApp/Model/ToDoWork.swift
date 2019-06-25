//
//  File.swift
//  ToDoApp
//
//  Created by TuanLA on 6/25/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

class ToDoWork {
    private var _createdDate: String
    private var _workDetail: String
    private var _isDone: Bool = false
    
    var createdDate: String {
        return _createdDate
    }
    var workDetail: String {
        return _workDetail
    }
    var isDone: Bool {
        return _isDone
    }
    
    init() {
        _createdDate = ""
        _workDetail = ""
    }
    
    init(createDate: String, workDetail: String) {
        _createdDate = createDate
        _workDetail = workDetail
    }
    
}
