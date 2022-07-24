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
        
        // 1초 뒤에 마음카드가 받아졌는지 확인
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
                self.letterTabelView.allowsSelection = false
            }
        }
    }
    
    // 파이어베이스에서 가져온 마음 카드가 있을 경우에, 테이블 뷰의 opacity를 1로 설정
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print(letters.count)
        if letters.count != 0 {
            letterTabelView.layer.opacity = 1
        }
    }
    
    // 보내기 버튼을 눌렀을 때 마음 편지 쓰는 뷰로 이동
    @objc func sendLetterButtonPressed() {
        guard let letterViewController = storyboard?.instantiateViewController(withIdentifier: "LetterView") as? LetterViewController else {
            return
        }
        navigationController?.pushViewController(letterViewController, animated: true)
    }
    
    // 더보기 버튼을 눌렀을 때, PatientLetterDetailView로 이동하도록 설정
    @objc func detailButtonPressed() {
        guard let patientLetterDetailViewController = storyboard?.instantiateViewController(withIdentifier: "PatientLetterDetailView") as? PatientLetterDetailViewController else {
            return
        }
        navigationController?.pushViewController(patientLetterDetailViewController, animated: true)
    }
}

extension PatientMainViewController {
    // 파이어베이스에서 마음 카드 데이터를 가져오는 작업 실행
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
        let date = String(letters[indexPath.row].date.suffix(5))
        
        // 각 셀에 데이터를 바인딩하고, 버튼 액션을 설정
        letterCell.letterTo.text = letters[indexPath.row].letterTo
        letterCell.letterContent.text = letters[indexPath.row].letterContent
        letterCell.dateLabel.text = date
        letterCell.detailButton.addTarget(self, action: #selector(detailButtonPressed), for: .touchUpInside)
        
        return letterCell
    }
}
