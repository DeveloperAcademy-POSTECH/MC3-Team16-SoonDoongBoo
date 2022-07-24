//
//  PatientLetterDetailViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/23.
//

import UIKit

class PatientLetterDetailViewController: UIViewController {
    var letterToText: String? = "Test To Text"
    var letterContentText: String? = "Test Content Text"
    
    @IBOutlet weak var letterTo: UILabel!
    @IBOutlet weak var letterContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letterTo.text = letterToText
        letterContent.text = letterContentText
    }

}
