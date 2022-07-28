//
//  NurseMainCustomHeader.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/19.
//

import UIKit

class NurseMainSectionHeader: UITableViewHeaderFooterView {
    let headerTitle = UILabel()
    let headerButton = UIButton()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.font = UIFont.boldSystemFont(ofSize: 16)
        
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        headerButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        headerButton.setTitleColor(.gray, for: .normal)
        
        contentView.addSubview(headerTitle)
        contentView.addSubview(headerButton)
        
        //TODO: 여백 조절 필요 -> NSLayoutConstraint에 대한 이해 필요
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: -20),
            headerTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            headerButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 20),
            headerButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
}
