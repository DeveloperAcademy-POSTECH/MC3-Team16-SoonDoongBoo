//
//  DDayTableCell.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/20.
//

import UIKit

class PatientLetterTableCell: UITableViewCell {
    
    @IBOutlet weak var letterTo: UILabel!
    @IBOutlet weak var letterContent: UILabel!
    @IBOutlet weak var dateView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dateView.layer.cornerRadius = 15
        contentView.layer.cornerRadius = 10
        letterContent.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }

}
