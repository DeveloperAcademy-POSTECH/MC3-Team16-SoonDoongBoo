//
//  NurseMainLetterViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/24.
//

import UIKit

class NurseMainLetterViewController: UIViewController {
    var letters: [Letter] = Letter.sampleData
    
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var descriptionStack: UIStackView!
    @IBOutlet weak var letterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hospitalNameLabel.text = UserDefaults.standard.string(forKey: "hospital")
        descriptionStack.layer.cornerRadius = 15
        
        letterTableView.delegate = self
        letterTableView.dataSource = self
        letterTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        letterTableView.showsVerticalScrollIndicator = false
        
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popToPrevious))
        backButton.tintColor = .black
        navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}

extension NurseMainLetterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let letterCell = letterTableView.dequeueReusableCell(withIdentifier: "NurseLetterTableCell", for: indexPath) as! NurseLetterTableCell
        let date = String(letters[indexPath.row].date.suffix(5))
        
        letterCell.letterTo.text = letters[indexPath.row].letterTo
        letterCell.letterContent.text = letters[indexPath.row].letterContent
        letterCell.date.text = date
        
        return letterCell
    }
    
    
}
