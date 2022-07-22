//
//  NurseMainViewController.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/18.
//

import UIKit
import SwiftUI

class NurseMainViewController: UIViewController {

    //샘플 데이터
    let cheeringText: [String] = [
        "오늘 하루도 수고하셨습니다.가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하",
        "오늘 하루도 수고하셨습니다.가나다라마바사"
    ]
    let letters = Letter.sampleData
    let dDays = DDay.sampleData
    
    let cellIdentifier = ["CheeringCustomCell", "dDayCustomCell", "letterCustomCell"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //TODO: - NurseMainTableHeader 클래스로 추출할 것
        //tablve view header설정
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width-40, height: 150))
        
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.font = UIFont.systemFont(ofSize: 32)
        headerLabel.textAlignment = .left
        headerLabel.numberOfLines = 0
        headerLabel.text = cheeringText.randomElement()
        let newSize = headerLabel.sizeThatFits(CGSize(width: headerLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.frame.size = newSize
        header.frame.size = CGSize(width: newSize.width, height: newSize.height+50)
        header.addSubview(headerLabel)
        tableView.tableHeaderView = header
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -20)
        ])
        
        //section header
        tableView.register(NurseMainSectionHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    //button 클릭 시 이벤트
    @objc func btnClick (_ button: UIButton) {
        print("버튼 클릭 시 이벤트")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension NurseMainViewController: UITableViewDelegate{
    //섹션 별 셀 높이 구분
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section==0 ? 50 : 254
    }
    //sectoin header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:"sectionHeader") as! NurseMainSectionHeader
        switch section {
        case 0:
            view.headerTitle.text = "D-Day"
            view.headerButton.setTitle("수정하기", for: .normal)
        default:
            view.headerTitle.text = "받은 마음카드"
            view.headerButton.setTitle("더보기", for: .normal)
        }
       return view
    }
    //section header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension NurseMainViewController: UITableViewDataSource{
    
    //섹션 수 - dday list, letter list
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //섹션 별 아이템 수 구분
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section==0 ? dDays.count : letters.count
    }
    //section에 따른 셀 종류 구분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[1], for: indexPath) as! DDayCustomTableViewCell
            cell.selectionStyle = .none
//            cell.cellView.layer.cornerRadius = 10

            cell.dDayTitleLabel.text = dDays[indexPath.row].title
            cell.dDayDateLabel.text = dDays[indexPath.row].date.formatted(date: .numeric, time: .omitted)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[2], for: indexPath) as! LetterCustomTableViewCell

            cell.cellView.layer.cornerRadius = 10
            cell.selectionStyle = .none

            cell.letterTitleLabel.text = letters[indexPath.row].letterTo
            cell.letterContentLabel.text = letters[indexPath.row].letterContent
            cell.letterDateLabel.text = letters[indexPath.row].date
            return cell
        }
    }
}
