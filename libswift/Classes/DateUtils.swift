//
//  DateUtils.swift
//  Pods
//
//  Created by sora on 2016/11/04.
//
//

import Foundation

public class DateUtils {
    public static func create(year:Int, month:Int, day:Int, hour:Int = 0, minute:Int = 0, second:Int = 0, nanosecond:Int = 0)-> Date? {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        return Calendar.current.date(from: components)
    }
}
