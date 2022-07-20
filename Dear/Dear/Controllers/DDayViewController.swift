//
//  DDayViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/20.
//

import UIKit

class DDayViewController: UIViewController {
    let cellName = "DDayTableCell"
    let ddayTitle = ["월급 받는 날", "입사날"]
    let ddayDate = ["2020-07-13", "2020-07-13"]

    @IBOutlet weak var ddayTableView: UITableView!
    
    @IBAction func ConfirmButtonItemPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ddayTableView.delegate = self
        ddayTableView.dataSource = self
    }


}

extension DDayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ddayTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ddayTableCell = ddayTableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! DDayTableCell
        
        ddayTableCell.ddayTitle.text = ddayTitle[indexPath.row]
        ddayTableCell.ddayDatePicker.maximumDate = Date()
        
        return ddayTableCell
    }
    
    
}
