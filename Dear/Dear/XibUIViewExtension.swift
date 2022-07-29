//
//  XibUIViewExtension.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit

//TODO: 머지 후 파일 삭제
/*
//출처: https://poky-develop.tistory.com/16
class XibUIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        let className = String(describing: type(of: self))
        guard let view = self.loadViewFromNib(nibName: className) else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
}

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
 
 */
