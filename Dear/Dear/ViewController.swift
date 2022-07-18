//
//  ViewController.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SelectionnurseView: UIView!
    @IBOutlet weak var SelectionpatientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SelectionnurseView.layer.cornerRadius = 10
        SelectionpatientView.layer.cornerRadius = 10
        SelectionnurseView.layer.borderColor = UIColor(named: "ButtonBorderColor")?.cgColor
        SelectionpatientView.layer.borderColor = UIColor(named: "ButtonBorderColor")?.cgColor
        SelectionnurseView.layer.borderWidth = 2
        SelectionpatientView.layer.borderWidth = 2
        
        
        let nuresTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionnurseTapped))
        SelectionnurseView.addGestureRecognizer(nuresTapGestureRecognizer)
        
        let patientTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewSelectionpatientTapped))
        SelectionpatientView.addGestureRecognizer(patientTapGestureRecognizer)
    }
    
    
    @objc func viewSelectionnurseTapped(sender: UITapGestureRecognizer) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "vc1") as? ViewController1 else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func viewSelectionpatientTapped(sender: UITapGestureRecognizer) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "vc2") as? ViewController2 else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
