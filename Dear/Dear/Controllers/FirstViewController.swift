//
//  FirstViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/20.
//

import UIKit

class FirstViewController: UIViewController {

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
        
        
        let nuresTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionNurseTapped))
        selectionNurseView.addGestureRecognizer(nuresTapGestureRecognizer)
        
        let patientTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionPatientTapped))
        selectionPatientView.addGestureRecognizer(patientTapGestureRecognizer)
    }
    
    @objc func viewSelectionNurseTapped(sender: UITapGestureRecognizer) {
        print(" 클릭 됨")
        UserDefaults.standard.setValue( true , forKey: "isUserNurse")
        let vc = UIStoryboard(name: "SelectHospitalView", bundle: nil)
        guard let nextVC = vc.instantiateViewController(withIdentifier: "SelectHospitalView") as? HospitalViewController else {return}
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func viewSelectionPatientTapped(sender: UITapGestureRecognizer) {
        UserDefaults.standard.setValue( false , forKey: "isUserNurse")
        let vc = UIStoryboard(name: "SelectHospitalView", bundle: nil)
        guard let nextVC = vc.instantiateViewController(withIdentifier: "SelectHospitalView") as? HospitalViewController else {return}
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
