//
//  Data.swift
//  Dear
//
//  Created by 한연희 on 2022/07/18.
//
import Foundation

struct LetterItem: Codable {
    let hospistal: String
    let title: String
    let description: String
    var isCompleted = false
}
