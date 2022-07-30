//
//  LetterViewController.swift
//  Dear
//
//  Created by 한연희 on 2022/07/17.
//

import UIKit

class LetterViewController: UIViewController {
    @IBOutlet private weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var doneButton: UIBarButtonItem!
    @IBOutlet private weak var textView: UITextView!
    
    @IBOutlet private weak var letterTo: UITextField!
    private var check:[Bool] = [false, false, false, false, false]
    
    private var firebaseService = FirebaseService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isScrollEnabled = false
        doneButton.isEnabled = false
        placeholderSetting()
        textViewDidChange(textView)
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func PrintAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "처방전을 보낼까요?", message: "발송 완료 후 수정할 수 없습니다", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        let no = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        [no, yes].forEach { alert.addAction($0) }
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func selectBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        check[sender.tag] = sender.isSelected
        print(check)
    }
    @IBAction func pressedDoneButton(_ sender: UIBarButtonItem) {
        print("Done Button")
        
        let alert = UIAlertController(title: "처방전을 보낼까요?", message: "발송 완료 후 수정할 수 없습니다", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default) { _ in
            print("yes")
            let hospital = UserDefaults.standard.string(forKey: "hospital") ?? ""
            Task {
//                firebaseService.sendLetterToHospital(hospitalName: hospital, letterTo: letterTo.text ?? "", letterContent: textView.text, anger: check[0], calm: check[1], depression: check[2], joyful: check[3], sadness: check[4])
            }
        }
        let no = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        [no, yes].forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
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
    ///출처: https://hyongdoc.tistory.com/280
    func placeholderSetting() {
        textView.delegate = self
        textView.text = "처방전을 작성해주세요."
        textView.textColor = UIColor.lightGray
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            doneButton.isEnabled = false
            textView.text = "처방전을 작성해주세요."
            textView.textColor = UIColor.lightGray
        } else {
            doneButton.isEnabled = true
        }
    }
    
}
