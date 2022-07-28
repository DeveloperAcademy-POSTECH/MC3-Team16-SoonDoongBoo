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
        
        let nuresTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionnurseTapped))
        selectionNurseView.addGestureRecognizer(nuresTapGestureRecognizer)
        
        let patientTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionpatientTapped))
        selectionPatientView.addGestureRecognizer(patientTapGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        selectionNurseView.layer.backgroundColor = UIColor.pink_03.cgColor
        selectionPatientView.layer.backgroundColor = UIColor.pink_03.cgColor
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        DispatchQueue.main.async {
            self.selectionNurseView.layer.backgroundColor = UIColor.pink_03.cgColor
            self.selectionPatientView.layer.backgroundColor = UIColor.pink_03.cgColor
        }
    }
    
    @objc func viewSelectionnurseTapped(sender: UITapGestureRecognizer) {
        selectionNurseView.layer.backgroundColor = UIColor.pink_02.cgColor
        
        let stroyboard = UIStoryboard(name: "SelectHospital", bundle: nil)
        let selectHospitalViewContorller = stroyboard.instantiateViewController(withIdentifier: "HospitalView")
        
        UserDefaults.standard.set("nurse", forKey: "user")
        
        navigationController?.pushViewController(selectHospitalViewContorller, animated: true)
    }
    
    @objc func viewSelectionpatientTapped(sender: UITapGestureRecognizer) {
        selectionPatientView.layer.backgroundColor = UIColor.pink_02.cgColor
        
        let stroyboard = UIStoryboard(name: "SelectHospital", bundle: nil)
        let selectHospitalViewContorller = stroyboard.instantiateViewController(withIdentifier: "HospitalView")
        
        UserDefaults.standard.set("patient", forKey: "user")
        
        navigationController?.pushViewController(selectHospitalViewContorller, animated: true)
    }
}
