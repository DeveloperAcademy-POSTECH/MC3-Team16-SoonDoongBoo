//
//  NurseMainViewController.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/18.
//

import UIKit
import SwiftUI

class NurseMainViewController: UIViewController {

    //MARK: - firebase추가
    //firebase data
    var firebaseService = FirebaseService()
    var letters: [Letter] = []
    //샘플 데이터
    let cheeringText: [String] = [
        "오늘 하루도 수고하셨습니다.가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하",
        "오늘 하루도 수고하셨습니다.가나다라마바사"
    ]
    let letters_sample = Letter.sampleData
    let dDays = DDay.sampleData
    
    let cellIdentifier = ["CheeringCustomCell", "dDayCustomCell", "letterCustomCell"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
        var sectionHeader = NurseMainSectionHeader.self
        tableView.register(sectionHeader, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        //MARK: - Firebase 추가
        //firebase 초기 data 가져오기
        Task {
            letters = try await firebaseService.fetchLettersByHospital()
            print(letters)
            self.tableView.reloadData()
        }
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
        view.headerButton.addTarget(self, action: #selector(sectionBtnTapped(_:)), for: .touchUpInside)
       return view
    }
    //section header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //MARK: -  버튼 페이지 연결
    //sectioni header 버튼 클릭 시 다음 페이지 연결하는 함수
    @objc func sectionBtnTapped(_ button: UIButton) {
        if button.titleLabel?.text == "수정하기" {
            let vc = UIStoryboard(name: "DDayEditView", bundle: nil)
            guard let nextVc = vc.instantiateViewController(withIdentifier: "DDayEditView") as? DDayEditViewController else {return}
            self.present(nextVc, animated: true, completion: nil)
        }else {
            let vc = UIStoryboard(name: "CardListViewEx", bundle: nil)
            guard let nextVc = vc.instantiateViewController(withIdentifier: "CardListViewEx") as? CardListExViewController else {return}
            self.present(nextVc, animated: true, completion: nil)
        }
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

            cell.DDayTitleLabel.text = dDays[indexPath.row].title
            
            //MARK: - D-Day 기능 추가
            //디데이 계산
            print(dDays[indexPath.row].date, Date())
            cell.DDayDateLabel.text = updateDDay(dDay: dDays[indexPath.row])
            
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
    //MARK: - D-DAY 계산 기능 추가
    //디데이 계산 함수
    private func updateDDay(dDay: DDay) -> String {
        if dDay.calculateDays() < 0 {
            let day = abs(dDay.calculateDays()) + 1
            return "D+\(day)"
        } else if dDay.calculateDays() > 0 {
            let day = abs(dDay.calculateDays()) + 1
            return "D-\(day)"
        }else {
            return "D-Day"
        }
    }
}
