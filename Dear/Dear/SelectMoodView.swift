//
//  SelectMoodView.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import Foundation
import UIKit
import SwiftUI

class SelectMoodView: UIView {
    let title = UILabel()
    
    let moodList = ["기쁨", "분노", "슬픔", "평온", "우울" ]
    let moodImageNameList = ["Joyful", "Anger", "Sadness", "Calm", "Depression"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMoodStack()
        contentConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func contentConfigure() {
        
    }
    
    private func setMoodStack(){
        let hStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 27
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            
            return stackView
        }()
        
        let titleLabel = UILabel()
        titleLabel.text = "오늘 기분은 어떤가요?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0..<moodList.count {
            let moodImgBtn = UIButton()
            moodImgBtn.setImage(UIImage(named: moodImageNameList[i]), for: .normal)
            
            let moodText = UILabel()
            moodText.text = moodList[i]
            moodText.font = UIFont.systemFont(ofSize: 14)
            moodText.textAlignment = .center
            
            let vStackView = UIStackView()
            vStackView.translatesAutoresizingMaskIntoConstraints = false
            vStackView.axis = .vertical
            vStackView.spacing = 5
            
            vStackView.addArrangedSubview(moodImgBtn)
            vStackView.addArrangedSubview(moodText)
            hStackView.addArrangedSubview(vStackView)
        }
//        self.addSubview(titleLabel)
//        self.addSubview(hStackView)
        
        let contentStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 26
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.backgroundColor = UIColor.white
            
            return stackView
        }()
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(hStackView)
        contentStackView.frame.size = CGSize (width: self.frame.width, height: self.frame.height)
        
        self.addSubview(contentStackView)
        self.backgroundColor = UIColor.systemPink
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20),
            hStackView.topAnchor.constraint(equalTo: titleLabel.layoutMarginsGuide.bottomAnchor, constant: 26),
            
            contentStackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
//            contentStackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
