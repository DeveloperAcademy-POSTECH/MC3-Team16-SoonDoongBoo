//
//  PatientLetterDetailViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/23.
//

import UIKit

class PatientLetterDetailViewController: UIViewController {
    var letterToText: String? = "Test To Text"
    var letterContentText: String? = "Test Content Text"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popToPrevious))
        backButton.tintColor = .black
        navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
