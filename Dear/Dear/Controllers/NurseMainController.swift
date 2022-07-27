//
//  NurseMainViewController_2.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/27.
//

import UIKit

class NurseMainController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var moodView: UIView!
    
    let moodSelectView = SelectMoodView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moodView.addSubview(moodSelectView)
//
//        moodSelectView.center = moodView.convert(moodView.center, from:moodView.superview)
        moodSelectView.frame.size = CGSize(width: moodView.frame.width, height: moodView.frame.height)
    }

}
