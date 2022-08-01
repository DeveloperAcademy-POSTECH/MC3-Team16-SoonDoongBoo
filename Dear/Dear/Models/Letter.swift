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
    var anger: Bool
    var calm: Bool
    var depression: Bool
    var joyful: Bool
    var sadness: Bool
    
    var dictionary: [String: Any] {
        return [
            "date": date,
            "hospitalName": hospitalName,
            "letterTo": letterTo,
            "letterContent": letterContent,
            "uid": uid,
            "anger": anger,
            "calm": calm,
            "depression": depression,
            "joyful": joyful,
            "sadness": sadness
        ]
    }
}

extension Letter: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let date = dictionary["Date"] as? String,
              let hospitalName = dictionary["HospitalName"] as? String,
              let letterContent = dictionary["LetterContent"] as? String,
              let letterTo = dictionary["LetterTo"] as? String,
              let uid = dictionary["Uid"] as? String,
              let anger = dictionary["Anger"] as? Bool,
              let calm = dictionary["Calm"] as? Bool,
              let depression = dictionary["Depression"] as? Bool,
              let joyful = dictionary["Joyful"] as? Bool,
              let sadness = dictionary["Sadness"] as? Bool else { return nil }
        
        self.init(date: date, hospitalName: hospitalName, letterTo: letterTo, letterContent: letterContent, uid: uid, anger: anger, calm: calm, depression: depression, joyful: joyful, sadness: sadness)
    }
}
