//
//  LetterViewController.swift
//  Dear
//
//  Created by 한연희 on 2022/07/17.
//

import UIKit

class LetterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var letterTitle: UITextField! { didSet { letterTitle.delegate = self }}
    @IBOutlet weak var letterContext: UITextField! { didSet { letterContext.delegate = self }}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func PrintAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "마음카드를 보낼까요?", message: "발송 완료 후 수정할 수 없습니다", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        let no = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        [no, yes].forEach { alert.addAction($0) }
        
        present(alert, animated: true, completion: nil)
    }
    

}

// 키보드 숨기기
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
