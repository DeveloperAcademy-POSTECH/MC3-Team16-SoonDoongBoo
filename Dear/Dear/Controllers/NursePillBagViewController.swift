//
//  NursePillBagView.swift
//  Dear
//
//  Created by 김혜수 on 2022/07/27.
//

import UIKit

class NursePillBagViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleView: UIViewExtension!
    
    var letters: [Letter] = []
    let firebaseService = FirebaseService()
    
    override func viewDidAppear(_ animated: Bool) {
        titleView.layer.backgroundColor = UIColor.pink_01.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self

        Task {
            letters = try await firebaseService.fetchLettersByHospital(hospitalName: "포항성모병원")
            tableView.reloadData()
        }
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
    }
    
}

extension NursePillBagViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.letters.count == 0 {
            self.tableView.setEmpty("약 봉투가 비었어요.")
        } else {
            self.tableView.restore()
        }
        return self.letters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LetterCell", for: indexPath) as! NursePillBagViewCell
        let letter = self.letters[indexPath.row]
        
        //String -> Date
        let dateString:String = letter.date
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        let date:Date = dateFormatter.date(from: dateString)!
        dateFormatter.locale = Locale(identifier: "us")
        dateFormatter.dateFormat = "MMM d"

        //Date -> String
        cell.cellDate.text = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "EEEE"
        cell.cellDay.text = dateFormatter.string(from: date)
        cell.cellTitle.text = "기분이 좋아지는 약"
        cell.cellLetterTo.text = letter.letterTo

        let colorRandom = Int(arc4random_uniform(3)) //0~2난수 발생
        let color = [[UIColor.craft_02, UIColor.craft_01],[UIColor.pink_03, UIColor.pink_02],[UIColor.purple_03, UIColor.purple_02]]
        
        cell.cellBackgroundView.backgroundColor = color[colorRandom][0]
        cell.cellBorderView.borderColor = color[colorRandom][1]
        cell.cellLetterToBackgroundView.backgroundColor = color[colorRandom][1]
        return cell
    }
}

extension NursePillBagViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 277
    }
}

// 빈 약 뭉치일때
extension UITableView {
    func setEmpty(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "System", size: 16)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

