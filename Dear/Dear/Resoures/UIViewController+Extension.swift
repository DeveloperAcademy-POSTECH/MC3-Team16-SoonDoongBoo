//
//  UIViewController+Extension.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/30.
//

import UIKit

extension UIViewController {
    ///출처: https://seons-dev.tistory.com/entry/UIKit-%ED%99%94%EB%A9%B4-%ED%84%B0%EC%B9%98%ED%95%98%EC%97%AC-%ED%82%A4%EB%B3%B4%EB%93%9C-%EB%82%B4%EB%A6%AC%EB%8A%94-%EB%B0%A9%EB%B2%95-textField
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
