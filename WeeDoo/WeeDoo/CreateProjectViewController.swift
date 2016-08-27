//
//  CreateProjectViewController.swift
//  WeeDoo
//
//  Created by hoangha052 on 8/23/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit
import CVCalendar

class CreateProjectViewController: BaseNavigationViewController {
    @IBOutlet weak var calendarMenuView: CVCalendarMenuView!

    @IBOutlet weak var calendarView: CVCalendarView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
          self.addNavigation("Create Project", titleLeftButton:"Cancel", titleRightButton: "Done")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarMenuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CreateProjectViewController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    func presentationMode() -> CalendarMode
    {
        return .MonthView
    }
    func firstWeekday() -> Weekday
    {
        return .Monday
    }

}


