//
//  Phrase.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/31.
//

import Foundation

struct Phrase {
    var mood: String
    var phrase: String
}

extension Phrase {
    static var data = [
        Phrase(mood: "Depression", phrase: "많이 힘들었죠? 오늘도 고생 많았아요."),
        Phrase(mood: "Depression", phrase: "울적한 날엔 달달한 걸 먹으면 괜찮아지더라구요."),
        Phrase(mood: "Depression", phrase: "지치고 힘들 때는 잠시 쉬어가세요."),
        
        Phrase(mood: "Sadness", phrase: "울고 싶으면 울어도 돼요. 괜찮아요."),
        Phrase(mood: "Sadness", phrase: "울어도 괜찮아요. 잠시 쉬어가세요."),
        Phrase(mood: "Sadness", phrase: "슬픈 하루가 지나면, 내일 당신에게 행복이 찾아오기를."),
        
        Phrase(mood: "Anger", phrase: "화가 날 땐, 잠시 심호흡을 해보세요."),
        Phrase(mood: "Anger", phrase: "잠시 산책하면서 마음을 가라앉혀 보세요."),
        Phrase(mood: "Anger", phrase: "물 한잔 드시면서 화를 가라앉혀 보세요."),
        
        Phrase(mood: "Calm", phrase: "남은 하루도 행복하게 보내세요."),
        Phrase(mood: "Calm", phrase: "조금 이따가 가볍게 티타임 어떠세요?"),
        Phrase(mood: "Calm", phrase: "덕분에 기분 좋은 하루에요!"),
        
        Phrase(mood: "Joyful", phrase: "내일도 오늘처럼 기쁜 일이 가득하길!"),
        Phrase(mood: "Joyful", phrase: "즐겁고 신나는 하루를 보내고 계시군요!"),
        Phrase(mood: "Joyful", phrase: "행복 만땅 즐거운 하루!"),
    ]
}
