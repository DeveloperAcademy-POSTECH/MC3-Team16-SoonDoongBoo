//
//  TextField.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/22.
//

import Foundation
import UIKit

// TextField 내부 텍스트 왼쪽에 패딩같이 넣어주는 코드
// https://developer-fury.tistory.com/46
extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
