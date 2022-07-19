//
//  Letter.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/19.
//

import Foundation

protocol DocumentSerializable {
    init?(dictionary: [String : Any])
}

struct Letter {
    var date: String
    var hospitalName: String
    var letterTo: String
    var letterContent: String
    var uid: String
    
    var dictionary: [String: Any] {
        return ["date": date, "hospitalName": hospitalName, "letterTo": letterTo, "letterContent": letterContent, "uid": uid]
    }
}

extension Letter: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let date = dictionary["Date"] as? String,
              let hospitalName = dictionary["HospitalName"] as? String,
              let letterTo = dictionary["LetterTo"] as? String,
              let letterContent = dictionary["LetterContent"] as? String,
              let uid = dictionary["uid"] as? String else { return nil }
        
        self.init(date: date, hospitalName: hospitalName, letterTo: letterTo, letterContent: letterContent, uid: uid)
    }
}
