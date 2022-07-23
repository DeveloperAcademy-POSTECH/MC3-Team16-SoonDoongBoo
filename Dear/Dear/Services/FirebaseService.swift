//
//  FirebaseService.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/19.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class FirebaseService {
    private let db = Firestore.firestore()
    private let uid = FirebaseAuth.getuid()
    
    // 병원 이름으로 마음 카드를 가져오는 함수
    func fetchLettersByHospital(hospitalName: String) async throws -> [Letter] {
        var letters: [Letter] = []
        
        let documents = try await db.collection("Letters").whereField("HospitalName", in: [hospitalName]).getDocuments()

        let models = documents.documents.map({ (document) -> Letter in
            if let model = Letter(dictionary: document.data()) {
                return model
            } else {
                fatalError("Unable to initialize type \(Letter.self) with dictionary \(document.data())")
            }
        })
        letters = models
        
        return letters
    }
    
    // 환자가 작성한 마음 카드를 가져오는 함수
    func fetchLettersByName() async throws -> [Letter] {
        var letters: [Letter] = []
        
        print(uid)
        let documents = try await db.collection("Letters").whereField("uid", in: [String(uid)]).getDocuments()
        
        let models = documents.documents.map({ (document) -> Letter in
            if let model = Letter(dictionary: document.data()) {
                return model
            } else {
                fatalError("Unable to initialize type \(Letter.self) with dictionary \(document.data())")
            }
        })
        letters = models
        
        return letters
    }

    // 병원 이름들을 가져오는 함수
    func fetchHospitals() async throws -> [Hospital] {
        var hospitals: [Hospital] = []
        
        let documents = try await db.collection("Hospital").getDocuments()
        
        let models = documents.documents.map({ (document) -> Hospital in
            if let model = Hospital(dictionary: document.data()) {
                return model
            } else {
                fatalError("Unable to initialize type \(Hospital.self) with dictionary \(document.data())")
            }
        })
        hospitals = models
        
        return hospitals
    }
    
    // 마음 카드를 파이어베이스에 등록하는 함수
    func sendLetterToHospital(hospitalName: String, letterTo: String, letterContent: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.string(from: Date())
        
        var ref: DocumentReference? = nil
        ref = db.collection("Letters").addDocument(data: [
            "Date": date,
            "HospitalName": hospitalName,
            "LetterTo": letterTo,
            "LetterContent": letterContent,
            "uid": String(uid)
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
