//
//  NSDateExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 6/13/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

extension NSDate {
    static func isoDateFormatter() -> NSDateFormatter {
        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" //2016-07-12T14:37:50.537
        
        return dateFormatter
    }
    
    static func isoDateStringFromDate(date: NSDate) -> String {
        let isoDateFormatter = NSDate.isoDateFormatter()
        return isoDateFormatter.stringFromDate(date)
    }
    
    static func dateStringFromDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.stringFromDate(date)
    }
    
    static func stringFromDate(date: NSDate, format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
//        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        return dateFormatter.stringFromDate(date)
    }
    
    static func shortStringFromDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.stringFromDate(date)
    }
    
    func minutesIntervalFromDate(date: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone.defaultTimeZone()
        
        var fromDate: NSDate?
        var toDate: NSDate?
        calendar.rangeOfUnit(.Day, startDate: &fromDate, interval: nil, forDate: self)
        calendar.rangeOfUnit(.Day, startDate: &toDate, interval: nil, forDate: date)
        
        let difference = calendar.components(.Day, fromDate: fromDate!, toDate: toDate!, options: [])
        return difference.minute
    }
    
    func dayIntervalFromDate(date: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone.defaultTimeZone()
        
        var fromDate: NSDate?
        var toDate: NSDate?
        calendar.rangeOfUnit(.Day, startDate: &fromDate, interval: nil, forDate: self)
        calendar.rangeOfUnit(.Day, startDate: &toDate, interval: nil, forDate: date)
        
        let difference = calendar.components(.Day, fromDate: fromDate!, toDate: toDate!, options: [])
        return difference.day
    }
    
    func dateByAddingDayInterval(day: Int) -> NSDate {
        let dateComponents = NSDateComponents()
        dateComponents.day = day
        
        let calendar = NSCalendar.currentCalendar()
        let newDate = calendar.dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))
        return newDate!
    }
    
    func nextDate() -> NSDate {
        return self.dateByAddingDayInterval(1)
    }
    
    func previousDate() -> NSDate {
        return self.dateByAddingDayInterval(-1)
    }
    
    static func formattedStringFromDuration(duration: Int) -> String {
        // duration in minute
        var formattedString = String()
        let hours = duration / 60
        let minutes = duration % 60
        
        if hours > 0 {
            formattedString = "\(hours)h"
        }
        if minutes > 0 {
            formattedString = formattedString + "\(minutes)m"
        }
        
        return formattedString
    }
    
    static func formattedStringFromSeconds(seconds: Int) -> String {
        var formattedString = String()
        let hours = seconds / 3600
        let minutes = (seconds / 60) % 60
        
        if hours > 0 {
            formattedString = "\(hours)h"
        }
        if minutes > 0 {
            formattedString = formattedString + "\(minutes)m"
        }
        
        return formattedString
    }
    
    func year() -> Int {
        let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year], fromDate: self)
        return dateComponents.year
    }
    
    func month() -> Int {
        let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Month], fromDate: self)
        return dateComponents.month
    }
    
    func day() -> Int {
        let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day], fromDate: self)
        return dateComponents.day
    }
}

extension NSDateFormatter {
    class func formatterWithString(formatString: String) -> NSDateFormatter {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter
    }
}
