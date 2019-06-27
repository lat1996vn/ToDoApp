//
//  File.swift
//  ToDoApp
//
//  Created by TuanLA on 6/25/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

class ToDoWork {
    private var _createdDate: String
    private var _completedDate: String = ""
    private var _workTitle: String
    private var _workDetail: String
    private var _isDone: Bool = false
    
    var createdDate: String {
        get {
            return _createdDate
        } set {
            _createdDate = newValue
        }
    }
    var completedDate: String {
        get {
            return _completedDate
        } set {
            _completedDate = newValue
        }
    }
    var workTitle: String {
        get {
            return _workTitle
        } set {
            _workTitle = newValue
        }
    }
    var workDetail: String {
        get {
            return _workDetail
        } set {
            _workDetail = newValue
        }
    }
    var isDone: Bool {
        get {
            return _isDone
        } set {
            _isDone = newValue
        }
    }
    
    init() {
        _createdDate = ""
        _workDetail = ""
        _workTitle = ""
    }
    
    init(createDate: String, workTitle: String, workDetail: String) {
        _createdDate = createDate
        _workDetail = workDetail
        _workTitle = workTitle
    }
    
}
