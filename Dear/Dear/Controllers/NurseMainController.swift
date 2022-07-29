//
//  NurseMainViewController_2.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit

class NurseMainController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!
    
    @IBOutlet private weak var hospitalLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var letterCountLabel: UILabel!
    
    @IBOutlet private weak var cheeringView: UIView!
    @IBOutlet private weak var selectMoodView: UIView!
    @IBOutlet private weak var chartView: UIView!
    
    @IBOutlet private weak var joyfulHeight: NSLayoutConstraint!
    @IBOutlet private weak var angerHeight: NSLayoutConstraint!
    @IBOutlet private weak var sadnessHeight: NSLayoutConstraint!
    @IBOutlet private weak var calmHeight: NSLayoutConstraint!
    @IBOutlet private weak var depressionHeight: NSLayoutConstraint!
    
    @IBOutlet private weak var joyfulBar: UIView!
    @IBOutlet private weak var angerBar: UIView!
    @IBOutlet private weak var sadnessBar: UIView!
    @IBOutlet private weak var calmBar: UIView!
    @IBOutlet private weak var depressionBar: UIView!
    
    //TODO: userdefault정보로 받아와서 넣기
    let hospitalName: String = UserDefaults.standard.string(forKey: "hospital") ?? "병원선택"
    
    var firebaseService = FirebaseService()
    var letters: [Letter] = []
    
    let moodList: [String] = ["Joyful", "Anger", "Sadness", "Calm", "Depression"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //TODO: 데이터 연결시 삭제
        UserDefaults.standard.set("포항성모병원", forKey: "hospital")
        
        setMoodCount()
        setDateLabel()
        
        hospitalLabel.text = hospitalName
        Task {
            letters = try await firebaseService.fetchLettersToday(hospitalName: hospitalName)
            letterCountLabel.text = "\(letters.count)개"
        }
        
        if UserDefaults.standard.integer(forKey: "today") == Date().getDate()
            && UserDefaults.standard.bool(forKey: "isSelectedMood") == true {
            cheeringView.isHidden = false
            selectMoodView.isHidden = true
        } else {
            cheeringView.isHidden = true
            selectMoodView.isHidden = false
        }

        setInitialChart()
    }
    private func setDateLabel() {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "YYYY년 MM월 dd일"
        dateLabel.text = formatter.string(from: current)
        dateLabel.textColor = UIColor.pink_01
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
        } else {
            //TODO: 사용자 선택 뷰에서 버튼을 누르는 순간 설정하도록 옮길 것
            moodList.forEach { id in
                UserDefaults.standard.integer(forKey: id)
            }
        }
    }
    //버튼 클릭 시 값 증가
    @IBAction func selectMood(_ sender: Any) {
        let button = sender as? UIButton
        let key = String(describing: button?.accessibilityIdentifier)
        let count = UserDefaults.standard.integer(forKey: "\(key)") + 1
        UserDefaults.standard.set(count, forKey: "\(key)")
        UserDefaults.standard.set(true, forKey: "isSelectedMood")
        UserDefaults.standard.set(Date().getDate(), forKey: "today")
        print("\(String(describing: button?.accessibilityIdentifier)), count: \(UserDefaults.standard.integer(forKey: "\(key)")), \(UserDefaults.standard.bool(forKey: "isSelectedMood")), \(UserDefaults.standard.integer(forKey: "today"))")
        
        cheeringView.isHidden = false
        selectMoodView.isHidden = true
        
        setChart(key: key)
    }
    //버튼 클릭시 차트 값 변경하는 함수
    private func setChart(key: String) {
        let count = UserDefaults.standard.integer(forKey: key)
        switch key {
        case "Optional(\"Joyful\")":
            self.joyfulHeight.constant = CGFloat(count) * 8.8
        case "Optional(\"Anger\")":
            self.angerHeight.constant = CGFloat(count) * 8.8
        case "Optional(\"Sadness\")":
            self.sadnessHeight.constant = CGFloat(count) * 8.8
        case "Optional(\"Calm\")":
            self.calmHeight.constant = CGFloat(count) * 8.8
        case "Optional(\"Depression\")":
            self.depressionHeight.constant = CGFloat(count) * 8.8
        default: break
        }
        UIView.animate(withDuration: 0.2, animations: {
            self.chartView.layoutIfNeeded()
        })
    }
    //차트뷰 초기값 세팅 함수
    private func setInitialChart() {
        joyfulBar.layer.cornerRadius = 4
        angerBar.layer.cornerRadius = 4
        sadnessBar.layer.cornerRadius = 4
        calmBar.layer.cornerRadius = 4
        depressionBar.layer.cornerRadius = 4
        
        let count = [
            UserDefaults.standard.integer(forKey: "Optional(\"Joyful\")"),
            UserDefaults.standard.integer(forKey: "Optional(\"Anger\")"),
            UserDefaults.standard.integer(forKey: "Optional(\"Sadness\")"),
            UserDefaults.standard.integer(forKey: "Optional(\"Calm\")"),
            UserDefaults.standard.integer(forKey: "Optional(\"Depression\")")
        ]
        self.joyfulHeight.constant = CGFloat(count[0]) * 8.8
        self.angerHeight.constant = CGFloat(count[1]) * 8.8
        self.sadnessHeight.constant = CGFloat(count[2]) * 8.8
        self.calmHeight.constant = CGFloat(count[3]) * 8.8
        self.depressionHeight.constant = CGFloat(count[4]) * 8.8
    }
}
