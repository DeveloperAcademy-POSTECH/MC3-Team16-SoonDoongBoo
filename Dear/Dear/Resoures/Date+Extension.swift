//
//  Date+Extension.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/29.
//

import Foundation

extension Date {
    func getDate() -> Int {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "dd"
        let today = Int(formatter.string(from: current)) ?? -1
        
        return today
    }
    func getMonthString() -> String {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "default")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: current)
        
        return month
    }
    func getMonthInt() -> Int {
        let current = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "M"
        let month = Int(formatter.string(from: current)) ?? 0
        
        return month
    }
    func getAllDate() -> String {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "YYYY년 MM월 dd일"
        let date = formatter.string(from: current)
        
        return date
    }
    func getAllDateforPrescription() -> String {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "YY.MM.dd"
        let date = formatter.string(from: current)
        
        return date
    }
    //출처: https://stackoverflow.com/questions/33605816/first-and-last-day-of-the-current-month-in-swift
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    func endOfMonth() -> Int {
        let endDate = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "d"
        let endDay = Int(formatter.string(from: endDate)) ?? 0
        return endDay
    }
}
