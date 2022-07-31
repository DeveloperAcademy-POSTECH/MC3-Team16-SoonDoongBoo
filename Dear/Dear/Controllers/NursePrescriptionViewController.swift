//
//  NursePrescriptionView.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/28.
//

import UIKit

final class NursePrescriptionViewController: UIViewController {
    
    //TODO: 서버 데이터 받아와서 연결하기
    var letter = Letter.sampleData[0]

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    @IBOutlet private weak var depressionView: UIView!
    @IBOutlet private weak var sadnessView: UIView!
    @IBOutlet private weak var angerView: UIView!
    @IBOutlet private weak var calmView: UIView!
    @IBOutlet private weak var joyfulView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 보이도록 설정(환자 메인에서 넘어올 경우)
        navigationController?.isNavigationBarHidden = false
        
        let backButton = UIBarButtonItem(title: "이전", style: .plain, target: self, action: #selector(popView))
        backButton.tintColor = .black
        navigationItem.hidesBackButton = true
        navigationItem.setLeftBarButton(backButton, animated: true)
        
        dateLabel.text = letter.date
        nameLabel.text = letter.letterTo
        contentLabel.text = letter.letterContent
        
        setMedicine()
    }
    
    private func setMedicine() {
        depressionView.isHidden = !letter.depression
        sadnessView.isHidden = !letter.sadness
        angerView.isHidden = !letter.anger
        calmView.isHidden = !letter.calm
        joyfulView.isHidden = !letter.joyful
    }
    
    @objc private func popView() {
        navigationController?.popViewController(animated: true)
    }
}
