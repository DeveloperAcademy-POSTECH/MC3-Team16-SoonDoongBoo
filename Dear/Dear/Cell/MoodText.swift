//
//  File.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit

@IBDesignable
class MoodText: XibUIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.frame = self.bounds
        self.translatesAutoresizingMaskIntoConstraints = true
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
