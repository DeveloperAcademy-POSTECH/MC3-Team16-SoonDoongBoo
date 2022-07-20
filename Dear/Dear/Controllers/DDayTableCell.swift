//
//  DDayTableCell.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/20.
//

import UIKit

class DDayTableCell: UITableViewCell {

    @IBOutlet weak var ddayTitle: UILabel!
    @IBOutlet weak var ddayDatePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
