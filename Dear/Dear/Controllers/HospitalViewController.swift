//
//  HospitalViewController.swift
//  Dear
//
//  Created by 한연희 on 2022/07/17.
//
import UIKit

class HospitalViewController: UIViewController {
    
    @IBOutlet weak var hospitalTextField: UITextField!
    
    var hospitals: [Hospital] = [Hospital(hospitalName: "병원을 선택해주세요.")]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        hospitalTextField.inputView = pickerView
        hospitalTextField.borderStyle = .none
        hospitalTextField.layer.cornerRadius = 10
        hospitalTextField.backgroundColor = UIColor(named: "TextFieldBackgroundColor")
        hospitalTextField.textAlignment = .left
        hospitalTextField.addLeftPadding()
        hospitalTextField.text = hospitals[0].hospitalName
        
        let backButton = UIBarButtonItem(title: "이전", style: .plain, target: self, action: #selector(popToPrevious))
        backButton.tintColor = .black
        navigationItem.setLeftBarButton(backButton, animated: true)
        
        let confirmButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(pushToNext))
        confirmButton.tintColor = .black
        navigationItem.setRightBarButton(confirmButton, animated: true)
        
        setup()
    }
    
    // Navigation 상에서 뒤로 가기 위한 액션 구현
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func pushToNext() {
        let user = UserDefaults.standard.string(forKey: "user")
        
        if hospitalTextField.text != "병원을 선택해주세요." {
            switch user {
            case "nurse":
                UserDefaults.standard.set(hospitalTextField.text, forKey: "hospital")
                guard let nurseViewController = UIStoryboard(name: "NurseMainView", bundle: nil).instantiateViewController(withIdentifier: "NurseMainView") as? NurseMainViewController else {
                    return
                }
                navigationController?.pushViewController(nurseViewController, animated: true)
            case "patient":
                UserDefaults.standard.set(hospitalTextField.text, forKey: "hospital")
                guard let patientViewController = storyboard?.instantiateViewController(withIdentifier: "PatientMainView") as? PatientMainViewController else {
                    return
                }
                navigationController?.pushViewController(patientViewController, animated: true)
            default:
                fatalError("Error : Not Select User")
            }
        }
    }
}

extension HospitalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hospitals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hospitals[row].hospitalName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hospitalTextField.text = hospitals[row].hospitalName
        hospitalTextField.resignFirstResponder()
    }
}

extension HospitalViewController {
    func setup() {
        let firebaseService = FirebaseService()
        Task {
            hospitals = try await firebaseService.fetchHospitals()
        }
    }
}
