//
//  NurseMainViewController.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/18.
//

import UIKit
import SwiftUI

class NurseMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cheeringText: [String] = [
        "오늘 하루도 수고하셨습니다.가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하",
        "오늘 하루도 수고하셨습니다."
    ]
    let letters = Letter.sampleData
    let dDays = DDay.sampleData
    
    let cellIdentifier = ["CheeringCustomCell", "dDayCustomCell", "letterCustomCell"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tablve view header설정
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width-40, height: 150))
//        header.backgroundColor = .systemMint
        
        let headerLabel = UILabel(frame: header.bounds)
        
        headerLabel.font = UIFont.systemFont(ofSize: 32)
        headerLabel.textAlignment = .left
        headerLabel.numberOfLines = 0
        headerLabel.text = cheeringText.randomElement()
        let newSize = headerLabel.sizeThatFits(CGSize(width: headerLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.frame.size = newSize
        header.frame.size = newSize
        header.addSubview(headerLabel)
        
        tableView.tableHeaderView = header
        
        //section header
        tableView.register(NurseMainCustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        super.viewDidLoad()
    }
    //button 클릭 시 이벤트
    @objc func btnClick (_ button: UIButton) {
        print("버튼 클릭 시 이벤트")
    }
    
    //sectoin header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:"sectionHeader") as! NurseMainCustomHeader
        switch section {
        case 0:
            view.headerTitle.text = "D-day"
            view.headerButton.setTitle("수정하기", for: .normal)
        default:
            view.headerTitle.text = "받은 마음카드"
            view.headerButton.setTitle("더보기", for: .normal)
        }

       return view
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //섹션 별 아이템 수 구분
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section==0 ? dDays.count : letters.count
    }
    
    //섹션 별 셀 높이 구분
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section==0 ? 50 : 254
    }

    //section에 따른 셀 종류 구분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[1], for: indexPath) as! DDayCustomTableViewCell

            cell.cellView.layer.cornerRadius = 10
            cell.selectionStyle = .none

            cell.DDayTitleLabel.text = dDays[indexPath.row].title
            cell.DDayDateLabel.text = dDays[indexPath.row].date.formatted(date: .numeric, time: .omitted)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[2], for: indexPath) as! LetterCustomTableViewCell

            cell.cellView.layer.cornerRadius = 10
            cell.selectionStyle = .none

            cell.letterTitleLabel.text = letters[indexPath.row].title
            cell.letterContentLabel.text = letters[indexPath.row].content
            cell.letterDateLabel.text = letters[indexPath.row].date.formatted(date: .numeric, time: .omitted)
            return cell
        }
    }
    //섹션 수 - dday list, letter list
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
