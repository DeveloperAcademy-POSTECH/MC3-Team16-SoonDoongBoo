//
//  NursePillBagView.swift
//  Dear
//
//  Created by 김혜수 on 2022/07/27.
//

import UIKit

class NursePillBagViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var letters: [Letter] = Letter.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}

extension NursePillBagViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.letters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LetterCell", for: indexPath) as! NursePillBagViewCell
        let letter = self.letters[indexPath.row]
        
        cell.cellDate.text = letter.date
        cell.cellDay.text = letter.date
        cell.cellTitle.text = "기분이 좋아지는 약"
        cell.cellLetterTo.text = letter.letterTo

        return cell
    }
}

extension NursePillBagViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 277
    }
}
