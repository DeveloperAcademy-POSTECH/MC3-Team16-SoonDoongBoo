//
//  Data.swift
//  Dear
//
//  Created by 한연희 on 2022/07/18.
//
import Foundation

struct LetterItem: Codable {
    //병원 정보
    let hospistal: String
    //편지 내용
    let title: String
    let description: String
    //작성 완료여부 체크
    var isCompleted: Bool = false
}
