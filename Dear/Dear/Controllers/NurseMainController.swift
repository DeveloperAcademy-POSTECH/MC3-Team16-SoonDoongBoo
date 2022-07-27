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
    
    let moodSelect = SelectMood()
    let moodText = MoodText()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: 추후 color extension 색으로 변경 필요
        moodView.layer.cornerRadius = 10
        moodView.layer.shadowColor = UIColor.gray.cgColor
        moodView.layer.shadowOpacity = 0.25
        moodView.layer.shadowRadius = 8
        
        moodSelect.frame.size = CGSize(width: moodView.frame.width, height: moodView.frame.height)
//        moodView.addSubview(moodSelect)
        moodView.addSubview(moodText
        )
        moodSelect.center = moodView.convert(moodView.center, from:moodView.superview)
        
        moodSelect.frame = moodView.bounds
        moodSelect.translatesAutoresizingMaskIntoConstraints = true
        moodSelect.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }

}
