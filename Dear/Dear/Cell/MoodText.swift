//
//  File.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit

@IBDesignable
class MoodText: XibUIView {
    
    @IBOutlet weak var moodText: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func configure() {
        self.frame = self.bounds
        self.translatesAutoresizingMaskIntoConstraints = true
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    private func initialize() {
        Bundle.main.loadNibNamed("Mo", owner: self, options: nil)
        moodText.frame = self.bounds
        moodText.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        addSubview(moodText)
    }
}
