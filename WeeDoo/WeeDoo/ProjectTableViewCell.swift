//
//  ProjectTableViewCell.swift
//  WeeDoo
//
//  Created by HoangHa on 5/30/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var imageStatusView: UIImageView!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var completeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadDataCell(project: ProjectModel, index: Int) {
        numberLabel.text = String(index)
        projectNameLabel.text = project.name
        durationLabel.text = String(project.duration!)
        startLabel.text = NSDate.dateStringFromDate(project.startDate!)
        finishLabel.text = NSDate.dateStringFromDate(project.finishDate!)
        completeLabel.text = String(project.complete!)
        startLabel.text = project.status
    }
}
