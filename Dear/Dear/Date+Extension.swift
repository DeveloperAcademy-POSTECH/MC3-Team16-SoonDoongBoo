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
}
