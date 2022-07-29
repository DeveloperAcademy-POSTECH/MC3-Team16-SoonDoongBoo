//
//  NursePrescriptionView.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/28.
//

import UIKit

final class NursePrescriptionViewController: UIViewController {
    
    //TODO: 서버 데이터 받아와서 연결하기
    let letterSampleData = Letter.sampleData[0]

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    @IBOutlet private weak var depressionView: UIView!
    @IBOutlet private weak var sadnessView: UIView!
    @IBOutlet private weak var angerView: UIView!
    @IBOutlet private weak var calmView: UIView!
    @IBOutlet private weak var joyfulView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = letterSampleData.date
        nameLabel.text = letterSampleData.letterTo
        contentLabel.text = letterSampleData.letterContent
        
        setMedicine()
    }
    
    private func setMedicine() {
        depressionView.isHidden = !letterSampleData.depression
        sadnessView.isHidden = !letterSampleData.sadness
        angerView.isHidden = !letterSampleData.anger
        calmView.isHidden = !letterSampleData.calm
        joyfulView.isHidden = !letterSampleData.joyful
    }
}