//
//  FirstViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/20.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func nurseButtonPressed(_ sender: UIButton) {
        UserDefaults.standard.set("nurse", forKey: "user")
    }
    
    @IBAction func patientButtonPressed(_ sender: UIButton) {
        UserDefaults.standard.set("patient", forKey: "user")
    }
}
