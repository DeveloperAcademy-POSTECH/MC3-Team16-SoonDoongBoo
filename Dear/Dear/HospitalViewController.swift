//
//  HospitalViewController.swift
//  Dear
//
//  Created by 한연희 on 2022/07/17.
//

import UIKit

class HospitalViewController: UIViewController {
    
    
    @IBOutlet weak var hospitalPickerView: UIPickerView!
    
    let userDefaults = UserDefaults.standard
    let pickerViewSelectList = ["병원01", "병원02", "병원03"]
    var selectedPicker: String?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        /* let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        */
                
        self.hideKeyboardWhenTappedAround()
    }


}

