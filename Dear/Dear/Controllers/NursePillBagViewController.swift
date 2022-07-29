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
    }
    
}

extension NursePillBagViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.letters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LetterCell", for: indexPath) as! NursePillBagViewCell
        let letter = self.letters[indexPath.row]
        
        //print("\(letter.date)", type(of: letter.date)) //2022.07.28 String
        
        //String -> Date
        let dateString:String = "2022.07.29"

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        let date:Date = dateFormatter.date(from: dateString)!
        print("\(date)", type(of: date))
        dateFormatter.locale = Locale(identifier: "us")
        dateFormatter.dateFormat = "MMM d"
        print("\(dateFormatter.string(from: date))")
        
        //Date -> String
        
        cell.cellDate.text = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "EEEE"
        cell.cellDay.text = dateFormatter.string(from: date)
        cell.cellTitle.text = "기분이 좋아지는 약"
        cell.cellLetterTo.text = letter.letterTo

        let colorRandom = Int(arc4random_uniform(3)) //0~2난수 발생
        var color = [[UIColor.craft_02, UIColor.craft_01],[UIColor.pink_03, UIColor.pink_02],[UIColor.purple_03, UIColor.purple_02]]
        
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
