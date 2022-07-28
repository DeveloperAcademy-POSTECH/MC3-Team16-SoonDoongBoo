//
//  NurseMainViewController_2.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit

class NurseMainController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var moodView: UIView!
    
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var letterCountLabel: UILabel!
    
    @IBOutlet weak var cheeringView: UIView!
    
    //TODO: userdefault정보로 받아와서 넣기
    let hospitalName: String = UserDefaults.standard.string(forKey: "hospital") ?? "병원선택"
    
    var firebaseService = FirebaseService()
    var letters: [Letter] = []
    
    let moodList: [String] = ["Joyful", "Anger", "Sadness", "Calm", "Depression"]
    let moodSelect = SelectMood()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setMoodCount()
        ///데이터 연결시 삭제
        UserDefaults.standard.set("테스트 병원", forKey: "hospital")
        
        setDateLabel()
        hospitalLabel.text = hospitalName
        Task {
            letters = try await firebaseService.fetchLettersByHospital(hospitalName: "")
            letterCountLabel.text = "\(letters.count)개"
        }
        
        if UserDefaults.standard.integer(forKey: "today") == moodSelect.getDate()
            && UserDefaults.standard.bool(forKey: "isSelectedMood") == true {
            cheeringView.isHidden = false
            moodView.isHidden = true
        }else{
            cheeringView.isHidden = true
            moodView.isHidden = false
        }
    }
    
    private func setDateLabel() {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "YYYY년 MM월 dd일"
        dateLabel.text = formatter.string(from: current)
        //TODO: 추후 color extension 색으로 변경 필요
        dateLabel.textColor = UIColor(named: "temp_pink01")
    }
    private func getDate() -> Int {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "dd"
        let today = Int(formatter.string(from: current)) ?? -1
        
        return today
    }
    // 감정 선택 시 값 저장 세팅
    private func setMoodCount() {
        let formatter_day = DateFormatter()
        formatter_day.dateFormat = "dd"
        let currentDay = Int(formatter_day.string(from: Date())) ?? 0
        print(currentDay)
        
        if currentDay == 1 {
            
            moodList.forEach { id in
                UserDefaults.standard.set(0, forKey: id)
            }
        }else {
            //TODO: 사용자 선택 뷰에서 버튼을 누르는 순간 설정하도록 옮길 것
            moodList.forEach { id in
                UserDefaults.standard.integer(forKey: id)
            }
        }
    }
}
