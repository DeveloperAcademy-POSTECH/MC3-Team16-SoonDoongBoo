//
//  SelectMood.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit


//TODO: 머지 후 파일 삭제해야함
/*
@IBDesignable
class SelectMood: XibUIView {
    
    @IBOutlet weak var selectMood: UIView!
    @IBOutlet weak var moodButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    private func initialize() {
        Bundle.main.loadNibNamed("SelectMood", owner: self, options: nil)
        selectMood.frame = self.bounds
        selectMood.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        addSubview(selectMood)
    }
    //버튼 클릭 시 값 증가
    @IBAction func selectMood(_ sender: Any) {
        let button = sender as? UIButton
        let key = String(describing: button?.accessibilityIdentifier)
        let count = UserDefaults.standard.integer(forKey: "\(key)") + 1
        UserDefaults.standard.set(count, forKey: "\(key)")
        UserDefaults.standard.set(true, forKey: "isSelectedMood")
        UserDefaults.standard.set(getDate(), forKey: "today")
        print("\(String(describing: button?.accessibilityIdentifier)), count: \(UserDefaults.standard.integer(forKey: "\(key)")), \(UserDefaults.standard.bool(forKey: "isSelectedMood")), \(UserDefaults.standard.integer(forKey: "today"))")
    }
    func getDate() -> Int {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "dd"
        let today = Int(formatter.string(from: current)) ?? -1
        
        return today
    }
       
}
*/
