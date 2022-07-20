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
    //12글자까지 화면에 표시됨
    static var sampleData = [
        DDay(title: "월급 받는 날", date: Date().addingTimeInterval(600000.0)),
        DDay(title: "간호사 된 지", date: Date().addingTimeInterval(-600000.0)),
        DDay(title: "가나다라마바사아자차카타파하", date: Date())
    ]
}
#endif

//MARK: - D-DAY기능 추가
extension DDay {
    func calculateDays() -> Int {
        //TODO: 한국시간 기준으로 맞추기?
        var currentDate_date = Date()
        let offsetComps = Calendar.current.dateComponents([.day], from: currentDate_date, to: self.date)
        
        return offsetComps.day ?? -999
    }
}

