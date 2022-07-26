//
//  FirstViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/20.
//

import UIKit

class SelectUserViewController: UIViewController {

    @IBOutlet weak var selectionNurseView: UIView!
    @IBOutlet weak var selectionPatientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectionNurseView.layer.cornerRadius = 10
        selectionPatientView.layer.cornerRadius = 10
        selectionNurseView.layer.borderColor = UIColor(named: "ButtonBorderColor")?.cgColor
        selectionPatientView.layer.borderColor = UIColor(named: "ButtonBorderColor")?.cgColor
        selectionNurseView.layer.borderWidth = 2
        selectionPatientView.layer.borderWidth = 2
        
        
        let nuresTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionnurseTapped))
        selectionNurseView.addGestureRecognizer(nuresTapGestureRecognizer)
        
        let patientTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionpatientTapped))
        selectionPatientView.addGestureRecognizer(patientTapGestureRecognizer)
    }
    
    @objc func viewSelectionnurseTapped(sender: UITapGestureRecognizer) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "vc1") as? NurseViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func viewSelectionpatientTapped(sender: UITapGestureRecognizer) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "vc2") as? PatientViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}
