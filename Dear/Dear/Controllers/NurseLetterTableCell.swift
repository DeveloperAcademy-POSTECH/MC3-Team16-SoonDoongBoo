//
//  NurseLetterTableCell.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/24.
//

import UIKit

class NurseLetterTableCell: UITableViewCell {

    @IBOutlet weak var letterTo: UILabel!
    @IBOutlet weak var letterContent: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var dateStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dateStack.layer.cornerRadius = 15
        contentView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }
}
