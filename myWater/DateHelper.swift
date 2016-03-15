//
//  DateHelper.swift
//  myWater
//
//  Created by Marc Felden on 15.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation

public func <(a: NSDate, b: NSDate) -> Bool {
    return a.compare(b) == NSComparisonResult.OrderedAscending
}

public func ==(a: NSDate, b: NSDate) -> Bool {
    return a.compare(b) == NSComparisonResult.OrderedSame
}

extension NSDate: Comparable { }


extension NSDate {
    func isSameDayAs(date:NSDate) -> Bool {
        let dateformatterDay = NSDateFormatter()
        dateformatterDay.dateFormat = "dd.MM.yyyy"
        let date1String = dateformatterDay.stringFromDate(self)
        let date2String = dateformatterDay.stringFromDate(date)
        
        let dateformatterDateTime = NSDateFormatter()
        dateformatterDateTime.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
        let startDateString = date1String + " 00:00:00"
        let endDateString = date1String + " 23:59:59"
        
        let startDate = dateformatterDateTime.dateFromString(startDateString)
        let endDate = dateformatterDateTime.dateFromString(endDateString)
        
        

        if date >= startDate && date <= endDate {
        
        return true
        }
        return false
    }
}