//
//  PatientMainViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/23.
//

import UIKit

class PatientMainViewController: UIViewController {
    private var hospitalName = UserDefaults.standard.string(forKey: "hospital")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 우측 상단 네비게이션 아이템 설정 코드
        navigationItem.hidesBackButton = true
        let sendLetterButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(sendLetterButtonPressed))
        sendLetterButton.tintColor = .black
        navigationItem.setRightBarButton(sendLetterButton, animated: true)
        
        hospitalName = UserDefaults.standard.string(forKey: "hospital")
    }
    
    @objc func sendLetterButtonPressed() {
        guard let letterViewController = storyboard?.instantiateViewController(withIdentifier: "LetterView") as? LetterViewController else {
            return
        }
        navigationController?.pushViewController(letterViewController, animated: true)
    }
}
