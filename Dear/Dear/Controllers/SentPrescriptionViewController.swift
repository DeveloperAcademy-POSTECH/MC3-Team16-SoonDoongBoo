//
//  SentPrescriptionViewController.swift
//  Dear
//
//  Created by Tempnixk on 2022/07/24.
//

import UIKit


class SentPrescriptionViewController : UIViewController {
    
    @IBOutlet weak var labelSentPrescription: UILabel!
    @IBOutlet weak var labelHospitalName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelHospitalName.layer.cornerRadius = 10
        
    }
    
    
}


