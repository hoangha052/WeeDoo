//
//  ProjectModel.swift
//  WeeDoo
//
//  Created by hoangha052 on 9/13/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit

class ProjectModel: NSObject {
    
    var name: String?
    var status: String?
    var duration: Int?
    var startDate: NSDate?
    var finishDate: NSDate?
    var complete: Int?
    
     override init() {
        name = "Thu Thiem"
        status = "done"
        duration = 100
        startDate = NSDate()
        finishDate = NSDate()
        complete = 100
    }
    
}
