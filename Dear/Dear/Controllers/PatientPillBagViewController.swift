//
//  PatientPillBagViewController.swift
//  Dear
//
//  Created by Tempnixk on 2022/07/26.
//

import UIKit

class PatientPillBagViewController: UIViewController, UITableViewDataSource {
    private let firebaseService = FirebaseService()
    
    @IBOutlet weak var pillBag: UIStackView!
    @IBOutlet weak var sentPrescription: UIButton!
    @IBOutlet weak var pillBagTable: UITableView!
    
    private var letters: [Letter] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchLetterData()
        
        // Do any additional setup after loading the view.
        // 약뭉치 등 레이블쪽 관련된 부분
        pillBagTable.dataSource = self
        pillBagTable.delegate = self
        pillBag.layer.cornerRadius = 23
        pillBag.backgroundColor = UIColor.pink_01
        
        // table view 세팅
        pillBagTable.showsVerticalScrollIndicator = false
        pillBagTable.separatorStyle = .none
        
        // 초기 세팅 후 뒤로가기 버튼 제거
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchLetterData()
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func sentPrescriptionPressed(_ sender: UIButton) {
        let writeLetterStoryboard = UIStoryboard(name: "WriteLetter", bundle: nil)
                let writeLetterViewController = writeLetterStoryboard.instantiateViewController(withIdentifier: "LetterViewController")
                navigationController?.pushViewController(writeLetterViewController, animated: true)
    }
    
    // 테이블 뷰 셀 개수에 대한 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.letters.count
    }
    
    //테이블 뷰 셀 커스텀하는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "pillCell")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "pillCell", for: indexPath) as! PatientPillBagTableViewCell
        cell.selectionStyle = .none
        
        let letter = self.letters[indexPath.row]

        //아래의 더미 데이터들을 파이어베이스에서 불러오는 데이터로 바꿔줘야함
        cell.month.text = letter.date
        //cell.date.text = "24"
        cell.day.text = "Sunday"
        cell.title.text = "기분이 좋아지는 약"
        cell.toNurse.text = letter.letterTo
        
        return cell
    }
    
    // 선택된 셀에 정보를 넘기는 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seletedLetter = letters[indexPath.row]
        
        let storyboard = UIStoryboard(name: "NursePrescriptionView", bundle: nil)
        guard let prescriptionViewController = storyboard.instantiateViewController(withIdentifier: "NursePrescriptionViewController") as? NursePrescriptionViewController else { return }
        prescriptionViewController.letter = seletedLetter
        
        navigationController?.pushViewController(prescriptionViewController, animated: true)
    }
    
    func fetchLetterData() {
        Task {
            letters = try await firebaseService.fetchLettersByName()
            pillBagTable.reloadData()
        }
    }
}

//테이블 뷰 셀의 크기를 키워주는 익스텐션
extension PatientPillBagViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
}

// 점선 생성하는 익스텐션
extension UIView {
    func createDottedLine(width: CGFloat, color: CGColor) {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color
        caShapeLayer.lineWidth = width
        caShapeLayer.lineDashPattern = [10,5]
        let cgPath = CGMutablePath()
        let cgPoint = [CGPoint(x: 330, y: 30), CGPoint(x: 330, y: 230)]
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        layer.addSublayer(caShapeLayer)
    }
}
