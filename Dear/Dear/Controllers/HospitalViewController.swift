//
//  HospitalViewController.swift
//  Dear
//
//  Created by 한연희 on 2022/07/17.
//
import UIKit
class HospitalViewController: UIViewController {
    
    @IBOutlet weak var hospitalTextField: UITextField!
    
    let hospitals = ["병원01", "병원02", "병원03", "병원04", "병원05"]
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
        hospitalTextField.text = hospitals[0]
        
        let backButton = UIBarButtonItem(title: "이전", style: .plain, target: self, action: #selector(popToPrevious))
        backButton.tintColor = .black
        navigationItem.setLeftBarButton(backButton, animated: true)
        
        let confirmButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(pushToNext))
        confirmButton.tintColor = .black
        navigationItem.setRightBarButton(confirmButton, animated: true)
    }
    
    // Navigation 상에서 뒤로 가기 위한 액션 구현
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func pushToNext() {
        let user = UserDefaults.standard.string(forKey: "user")
        
        switch user {
        case "nurse":
            print("nurse")
        case "patient":
            print("patient")
        default:
            fatalError("Error : Not Select User")
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
        return hospitals[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hospitalTextField.text = hospitals[row]
        hospitalTextField.resignFirstResponder()
    }
}

