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
    @IBOutlet weak var monthLabel: UILabel!
    
    
    var animationFinished = true
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
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
    
    func initView()  {
        self.addNavigation("Create Project", titleLeftButton:"Cancel", titleRightButton: "Done")

         monthLabel.text = CVDate(date: NSDate()).globalDescription
    }
    
    
    func initDatePickerView() {
//        var datePickerView  : UIDatePicker = UIDatePicker()
//        datePickerView.datePickerMode = UIDatePickerMode.Time
//        StartTimeTextField.inputView = datePickerView
//        datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
//        
//        var datePickerView  : UIDatePicker = UIDatePicker()
//        datePickerView.datePickerMode = UIDatePickerMode.Time
//        EndTimeTextField.inputView = datePickerView
//        datePickerView.addTarget(self, action: Selector("handleDatePicker2:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    
    @IBAction func previousMonthButtonClick(sender: AnyObject) {
        calendarView.loadPreviousView()
    }
    
    @IBAction func nextMonthButtonClick(sender: AnyObject) {
        calendarView.loadNextView()
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

    func presentedDateUpdated(date: CVDate) {
        if monthLabel.text != date.globalDescription && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .Center
            updatedMonthLabel.text = date.globalDescription
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransformMakeTranslation(0, offset)
            updatedMonthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
            
            UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransformMakeTranslation(0, -offset)
                self.monthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransformIdentity
                
            }) { _ in
                
                self.animationFinished = true
                self.monthLabel.frame = updatedMonthLabel.frame
                self.monthLabel.text = updatedMonthLabel.text
                self.monthLabel.transform = CGAffineTransformIdentity
                self.monthLabel.alpha = 1
                updatedMonthLabel.removeFromSuperview()
            }
            
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
}


