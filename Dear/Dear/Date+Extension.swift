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
}
