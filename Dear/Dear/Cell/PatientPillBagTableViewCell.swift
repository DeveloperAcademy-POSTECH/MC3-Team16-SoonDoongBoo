//
//  PatientPillBagTableViewCell.swift
//  Dear
//
//  Created by Tempnixk on 2022/07/27.
//

import UIKit

class PatientPillBagTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellStackView: UIStackView!
    
    @IBOutlet weak var month: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var day: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var toNurse: UILabel!
    
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var borderView: UIView!
    
    // 테이블 뷰 셀 시작시 동작하는 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // 아래의 컬러는 컬러 익스텐션 추가한뒤에 다시 바꿀 예정
        self.contentView.createDottedLine(width: 1.0, color: UIColor.gray.cgColor)
        borderView.layer.borderColor = UIColor.purple.cgColor
        borderView.layer.borderWidth = 2
    }

    // 테이블 뷰 셀 클릭되었을 때 동작하는 함수
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 테이블 뷰 사이의 간격을 조절하는 함수
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0))
    }

}
