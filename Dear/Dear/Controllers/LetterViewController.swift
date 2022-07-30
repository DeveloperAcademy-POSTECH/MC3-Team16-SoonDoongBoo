//
//  LetterViewController.swift
//  Dear
//
//  Created by 한연희 on 2022/07/17.
//

import UIKit

class LetterViewController: UIViewController {
    
    private var isTextFilled = [false, false]
    @IBOutlet private weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var doneButton: UIBarButtonItem! {
        didSet { doneButton.isEnabled = false }
    }
    @IBOutlet private weak var textView: UITextView! {
        didSet { textView.isScrollEnabled = false }
    }
    @IBOutlet private weak var textViewPlaceholder: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var dateLabel: UILabel! {
        didSet { dateLabel.text = Date().getAllDateforPrescription() }
    }
    @IBOutlet private weak var letterTo: UITextField!
    ///anger, calm, depression, joyful, sadness 순서
    private var pillCheck:[Bool] = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textView.delegate = self
        
        textViewDidChange(textView)
        self.hideKeyboardWhenTappedAround()
        
        navigationController?.isNavigationBarHidden = false
     }
    @IBAction func selectBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        pillCheck[sender.tag] = sender.isSelected
    }
    @IBAction func pressedDoneButton(_ sender: UIBarButtonItem) {
        print("Done Button")
        
        let alert = UIAlertController(title: "처방전을 보낼까요?", message: "발송 완료 후 수정할 수 없습니다", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default) { _ in
            self.sendLetter()
        }
        let no = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        [no, yes].forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
    }
}

extension LetterViewController {
    func sendLetter() {
        let firebaseService = FirebaseService()
        let letterTo = letterTo.text!
        let letterContent = textView.text!
        let hospital = UserDefaults.standard.string(forKey: "hospital") ?? ""
        Task {
            firebaseService.sendLetterToHospital(hospitalName: hospital, letterTo: letterTo, letterContent: letterContent, anger: pillCheck[0], calm: pillCheck[1], depression: pillCheck[2], joyful: pillCheck[3], sadness: pillCheck[4])
        }
    }
    func checkButtonState() {
        if isTextFilled[0] && isTextFilled[1] {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
}

extension LetterViewController: UITextViewDelegate {
    ///출처: https://velog.io/@hyesuuou/Swift-UITextView-%EB%86%92%EC%9D%B4%EB%A5%BC-Contents-height%EC%99%80-%EA%B0%99%EA%B2%8C-%ED%95%98%EA%B8%B0
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            /// 180 이하일때는 더 이상 줄어들지 않게하기
            if estimatedSize.height <= 180 {
            }
            else {
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if range.location == 0 && range.length != 0 {
            isTextFilled[0] = false
            textViewPlaceholder.isHidden = false
            checkButtonState()
        } else {
            if !textView.text.isEmpty {
                isTextFilled[0] = true
                textViewPlaceholder.isHidden = true
            }
            checkButtonState()
        }
        return true
    }
}
extension LetterViewController: UITextFieldDelegate {
    //출처: https://kirkim.github.io/swift/2021/12/11/backspace.html
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && range.length != 0 {
            isTextFilled[1] = false
            checkButtonState()
        } else {
            isTextFilled[1] = true
            checkButtonState()
        }
        return true
    }
}
