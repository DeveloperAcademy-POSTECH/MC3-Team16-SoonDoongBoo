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

#if DEBUG
extension Letter {
    static var sampleData = [
        Letter(date: "220714", hospitalName: "포항성모병원", letterTo: "A 간호사님께", letterContent: "1- 이 밤 그날의 반딧불을 당신의 창 가까이 보낼게요 사랑한다는 말이에요 나 우리의 첫 입맞춤을 떠올려 그럼 언제든 눈을 감고 가장 먼 곳으로 가요 난 파도가 머물던 모래 위에 적힌 글씨처럼 그대가 멀리 사라져 버릴 것 같아 늘 그리워, 그리워 여기 내 마음속에 모든 말을 다 꺼내어 줄 순 없지만 사랑한다는 말이에요 어떻게 나에게 그대란 행운이 온 걸까 지금 우리 함께 있다면 아, 얼마나 좋을까요 난 파도가 머물던 모래 위에 적힌 글씨처럼 그대가 멀리 사라져 버릴 것 같아 또 그리워 더 그리워 나의 일기장 안에 모든 말을 다 꺼내어 줄 순 없지만 사랑한다는 말 이 밤 그날의 반딧불을 당신의 창 가까이 띄울게요 좋은 꿈이길 바라요", uid: "uid", anger: true, calm: false, depression: true, joyful: false, sadness: false),
        Letter(date: "220714", hospitalName: "포항성모병원", letterTo: "B 간호사님께", letterContent: "2- 이 밤 그날의 반딧불을 당신의 창 가까이 보낼게요 사랑한다는 말이에요 나 우리의 첫 입맞춤을 떠올려 그럼 언제든 눈을 감고 가장 먼 곳으로 가요 난 파도가 머물던 모래 위에 적힌 글씨처럼 그대가 멀리 사라져 버릴 것 같아 늘 그리워, 그리워 여기 내 마음속에 모든 말을 다 꺼내어 줄 순 없지만 사랑한다는 말이에요 어떻게 나에게 그대란 행운이 온 걸까 지금 우리 함께 있다면 아, 얼마나 좋을까요 난 파도가 머물던 모래 위에 적힌 글씨처럼 그대가 멀리 사라져 버릴 것 같아 또 그리워 더 그리워 나의 일기장 안에 모든 말을 다 꺼내어 줄 순 없지만 사랑한다는 말 이 밤 그날의 반딧불을 당신의 창 가까이 띄울게요 좋은 꿈이길 바라요", uid: "uid", anger: false, calm: true, depression: false, joyful: false, sadness: false),
        Letter(date: "220714", hospitalName: "포항성모병원", letterTo: "C 간호사님께", letterContent: "3- 이 밤 그날의 반딧불을 당신의 창 가까이 보낼게요 사랑한다는 말이에요 나 우리의 첫 입맞춤을 떠올려 그럼 언제든 눈을 감고 가장 먼 곳으로 가요 난 파도가 머물던 모래 위에 적힌 글씨처럼 그대가 멀리 사라져 버릴 것 같아 늘 그리워, 그리워 여기 내 마음속에 모든 말을 다 꺼내어 줄 순 없지만 사랑한다는 말이에요 어떻게 나에게 그대란 행운이 온 걸까 지금 우리 함께 있다면 아, 얼마나 좋을까요 난 파도가 머물던 모래 위에 적힌 글씨처럼 그대가 멀리 사라져 버릴 것 같아 또 그리워 더 그리워 나의 일기장 안에 모든 말을 다 꺼내어 줄 순 없지만 사랑한다는 말 이 밤 그날의 반딧불을 당신의 창 가까이 띄울게요 좋은 꿈이길 바라요", uid: "uid", anger: true, calm: false, depression: true, joyful: false, sadness: true)
    ]
}
#endif
