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
        hospitalTextField.textAlignment = .left
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

