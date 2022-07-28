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
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.createDottedLine(width: 1.0, color: UIColor.gray.cgColor)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0))
    }

}
