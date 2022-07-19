//
//  DDay.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/19.
//

import Foundation

struct DDay: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var date: Date
}

#if DEBUG
extension DDay {
    static var sampleData = [
        DDay(title: "월급 받는 날", date: Date()),
        DDay(title: "간호사 된 지", date: Date())
    ]
}
#endif
