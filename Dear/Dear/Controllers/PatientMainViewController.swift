//
//  PatientMainViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/23.
//

import UIKit

class PatientMainViewController: UIViewController {
    private var hospitalName = UserDefaults.standard.string(forKey: "hospital")
    private let letters = Letter.sampleData
    private let cellName = "PatientLetterTableCell"

    @IBOutlet weak var hospitalStackView: UIStackView!
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var letterTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 우측 상단 네비게이션 아이템 설정
        navigationItem.hidesBackButton = true
        let sendLetterButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(sendLetterButtonPressed))
        sendLetterButton.tintColor = .black
        navigationItem.setRightBarButton(sendLetterButton, animated: true)
        
        // 중간 병원 이름 라벨 설정
        hospitalName = UserDefaults.standard.string(forKey: "hospital")
        hospitalLabel.text = hospitalName
        hospitalStackView.layer.cornerRadius = 15
        
        // 테이블 뷰 설정
        letterTabelView.delegate = self
        letterTabelView.dataSource = self
        letterTabelView.separatorStyle = UITableViewCell.SeparatorStyle.none
        letterTabelView.showsVerticalScrollIndicator = false
    }
    
    @objc func sendLetterButtonPressed() {
        guard let letterViewController = storyboard?.instantiateViewController(withIdentifier: "LetterView") as? LetterViewController else {
            return
        }
        navigationController?.pushViewController(letterViewController, animated: true)
    }
}

extension PatientMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let letterCell = letterTabelView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! PatientLetterTableCell
        
        letterCell.letterTo.text = letters[indexPath.row].letterTo
        letterCell.letterContent.text = letters[indexPath.row].letterContent
        letterCell.dateLabel.text = letters[indexPath.row].date
        
        return letterCell
    }
}
