//
//  HospitalViewController.swift
//  Dear
//
//  Created by 한연희 on 2022/07/17.
//

import UIKit

class HospitalViewController: UIViewController {
    let firebaseService = FirebaseService()
    
    @IBOutlet weak var hospitalTextField: UITextField!
    
    var hospitals = [Hospital(hospitalName: "병원")]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setup()
        
        hospitalTextField.inputView = pickerView
        hospitalTextField.layer.cornerRadius = 10
        hospitalTextField.text = hospitals[0].hospitalName
        hospitalTextField.textAlignment = .left
        hospitalTextField.addLeftPadding(padding: 10.0)
        
        let backButton = UIBarButtonItem(title: "이전", style: .plain, target: self, action: #selector(popToPrevious))
        let confirmButton = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(pushToNext))
        backButton.tintColor = .black
        confirmButton.tintColor = .black
        
        navigationItem.setLeftBarButton(backButton, animated: true)
        navigationItem.setRightBarButton(confirmButton, animated: true)
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func pushToNext() {
        let hospitalName = hospitalTextField.text
        
        guard hospitalName == "병원" else { return }
        
        UserDefaults.standard.set(hospitalName, forKey: "hospital")
            
        switch UserDefaults.standard.string(forKey: "user") {
        case "nurse":
            print("nurse")
        case "patient":
            print("patient")
        default:
            fatalError("Error: User isn't Selected")
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
    private func setup() {
        Task {
            hospitals = try await firebaseService.fetchHospitals()
        }
    }
}

// TextFeild 내부 텍스트 왼쪽에 패딩을 넣어주는 코드
// https://developer-fury.tistory.com/46
extension UITextField {
    func addLeftPadding(padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

