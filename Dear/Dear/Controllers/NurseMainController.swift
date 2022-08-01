//
//  NurseMainViewController_2.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit

class NurseMainController: UIViewController {
    
    @IBOutlet private weak var cheeringView: UIView!
    @IBOutlet private weak var selectMoodView: UIView!
    @IBOutlet private weak var chartView: UIView!
    
    //MedicineBag properties
    @IBOutlet private weak var hospitalLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var letterCountLabel: UILabel!
    
    //chart properties
    @IBOutlet private weak var monthLabel: UILabel!
    
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
    
    @IBOutlet weak var phraseLabel: UILabel!
    
    
    private let hospitalName: String = UserDefaults.standard.string(forKey: "hospital") ?? "병원선택"
    
    var firebaseService = FirebaseService()
    var letters: [Letter] = []
    
    private let phraseData = Phrase.data
    private let keys: [String] = [ "Joyful", "Anger", "Sadness", "Calm", "Depression"]
    
    private let today: Int = Date().getDate()
    private let month: Int = Date().getMonthInt()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //다음달로 넘어갔을 경우 차트 초기화
        if month != UserDefaults.standard.integer(forKey: "month") {
            UserDefaults.standard.set(month, forKey: "month")
            keys.forEach { id in
                UserDefaults.standard.set(0, forKey: id)
            }
        }
        setLabel()
        Task {
            letters = try await firebaseService.fetchLettersToday(hospitalName: hospitalName)
            letterCountLabel.text = "\(letters.count)개"
        }
        //감정 선택 유무에 따라 띄우는 뷰 구분
        if UserDefaults.standard.integer(forKey: "today") == today {
            cheeringView.isHidden = false
            selectMoodView.isHidden = true
            setPhrase(idx: UserDefaults.standard.integer(forKey: "PhraseIndex"), mood: UserDefaults.standard.string(forKey: "mood") ?? "")
        } else {
            cheeringView.isHidden = true
            selectMoodView.isHidden = false
        }
        setInitialChart()
        
        // 처음 설정 후 이전 버튼 삭제
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    //label setting
    private func setLabel() {
        dateLabel.text = Date().getAllDate()
        dateLabel.textColor = UIColor.pink_01
        let monthString = Date().getMonthString()
        monthLabel.text = "1 \(monthString) - \(Date().endOfMonth()) \(monthString) "
        hospitalLabel.text = hospitalName
    }
    //버튼 클릭 시 값 증가
    @IBAction func selectMood(_ sender: UIButton) {
        let key = getKey(tag: sender.tag)
        
        let count = UserDefaults.standard.integer(forKey: key) + 1
        UserDefaults.standard.set(count, forKey: key)
        UserDefaults.standard.set(today, forKey: "today")
        UserDefaults.standard.set(key, forKey: "mood")
        
        cheeringView.isHidden = false
        selectMoodView.isHidden = true
        
        setPhrase(mood: key)
        setChart(key: key)
    }
    
    private func getKey(tag: Int) -> String {
        var key = ""
        switch tag {
        case 1:
            key = "Joyful"
        case 2:
            key = "Anger"
        case 3:
            key = "Sadness"
        case 4:
            key = "Calm"
        case 5:
            key = "Depression"
        default: break
        }
        return key
    }
    
    private func setPhrase(idx: Int = -1, mood: String) {
        let texts = phraseData.filter { $0.mood == mood }
        var index = idx
        if index == -1  {
            index = Int.random(in: 0..<texts.count)
        }
        phraseLabel.text = texts[index].phrase
        UserDefaults.standard.set(index, forKey: "PhraseIndex")
    }
    
    //버튼 클릭시 차트 값 변경하는 함수
    private func setChart(key: String) {
        let count = UserDefaults.standard.integer(forKey: key)
        switch key {
        case "Joyful":
            self.joyfulHeight.constant = CGFloat(count) * 8.8
        case "Anger":
            self.angerHeight.constant = CGFloat(count) * 8.8
        case "Sadness":
            self.sadnessHeight.constant = CGFloat(count) * 8.8
        case "Calm":
            self.calmHeight.constant = CGFloat(count) * 8.8
        case "Depression":
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
            UserDefaults.standard.integer(forKey: keys[0]),
            UserDefaults.standard.integer(forKey: keys[1]),
            UserDefaults.standard.integer(forKey: keys[2]),
            UserDefaults.standard.integer(forKey: keys[3]),
            UserDefaults.standard.integer(forKey: keys[4])
        ]
        self.joyfulHeight.constant = CGFloat(count[0]) * 8.8
        self.angerHeight.constant = CGFloat(count[1]) * 8.8
        self.sadnessHeight.constant = CGFloat(count[2]) * 8.8
        self.calmHeight.constant = CGFloat(count[3]) * 8.8
        self.depressionHeight.constant = CGFloat(count[4]) * 8.8
    }
}
