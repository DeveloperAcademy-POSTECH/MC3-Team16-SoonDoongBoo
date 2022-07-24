//
//  PatientLetterDetailViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/23.
//

import UIKit

class PatientLetterDetailViewController: UIViewController {
    var letterToText: String? = Letter.sampleData[0].letterTo
    var letterContentText: String? = Letter.sampleData[0].letterContent
    
    @IBOutlet weak var letterTo: UILabel!
    @IBOutlet weak var letterContent: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popToPrevious))
        backButton.tintColor = .black
        navigationItem.setLeftBarButton(backButton, animated: true)
        
        contentView.layer.cornerRadius = 10
        letterTo.text = letterToText
        letterContent.text = letterContentText
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
