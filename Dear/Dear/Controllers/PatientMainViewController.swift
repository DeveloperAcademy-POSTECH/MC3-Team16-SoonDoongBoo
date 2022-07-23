//
//  PatientMainViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/23.
//

import UIKit

class PatientMainViewController: UIViewController {
    private var hospitalName = UserDefaults.standard.string(forKey: "hospital")
    private var letters: [Letter] = []
    private let cellName = "PatientLetterTableCell"

    @IBOutlet weak var hospitalStackView: UIStackView!
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var letterTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
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
        letterTabelView.layer.opacity = 0
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            print(self.letters)
            //TODO: LetterContent가 안보이는 문제 발생
            // 내용은 전부 잘 들어옴
            if self.letters.count != 0 {
                self.letterTabelView.layer.opacity = 1
                self.letterTabelView.delegate = self
                self.letterTabelView.dataSource = self
                self.letterTabelView.separatorStyle = UITableViewCell.SeparatorStyle.none
                self.letterTabelView.showsVerticalScrollIndicator = false
            }
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print(letters.count)
        if letters.count != 0 {
            letterTabelView.layer.opacity = 1
        }
    }
    
    @objc func sendLetterButtonPressed() {
        guard let letterViewController = storyboard?.instantiateViewController(withIdentifier: "LetterView") as? LetterViewController else {
            return
        }
        navigationController?.pushViewController(letterViewController, animated: true)
    }
}

extension PatientMainViewController {
    func setup() {
        let firebaseService = FirebaseService()
        Task {
            letters = try await firebaseService.fetchLettersByName()
        }
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
