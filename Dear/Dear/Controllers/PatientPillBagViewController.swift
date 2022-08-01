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
        let colorRandom = Int(arc4random_uniform(3)) //0~2난수 발생
        let color = [[UIColor.craft_02, UIColor.craft_01],[UIColor.pink_03, UIColor.pink_02],[UIColor.purple_03, UIColor.purple_02]]
        
        cell.cellStackView.backgroundColor = color[colorRandom][1]
        cell.borderView.borderColor = color[colorRandom][1]
        cell.background.backgroundColor = color[colorRandom][0]
     


        //아래의 더미 데이터들을 파이어베이스에서 불러오는 데이터로 바꿔줘야함
        //String -> Date
        let dateString:String = letter.date
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        let date:Date = dateFormatter.date(from: dateString)!
        dateFormatter.locale = Locale(identifier: "us")
        dateFormatter.dateFormat = "MMM d"

        cell.selectionStyle = UITableViewCell.SelectionStyle.none
    
        //Date -> String
        cell.month.text = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "EEEE"
        cell.day.text = dateFormatter.string(from: date)
        
        //cell.date.text = "24"
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
        return 277
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
