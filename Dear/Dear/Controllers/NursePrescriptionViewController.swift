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

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var depressionView: UIView!
    @IBOutlet weak var sadnessView: UIView!
    @IBOutlet weak var angerView: UIView!
    @IBOutlet weak var calmView: UIView!
    @IBOutlet weak var joyfulView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = letterSampleData.date
        nameLabel.text = letterSampleData.letterTo
        contentLabel.text = letterSampleData.letterContent
        
        setMedicine()
    }
    
    private func setMedicine() {
        depressionView.isHidden = letterSampleData.depression ? false : true
        sadnessView.isHidden = letterSampleData.sadness ? false : true
        angerView.isHidden = letterSampleData.anger ? false : true
        calmView.isHidden = letterSampleData.calm ? false : true
        joyfulView.isHidden = letterSampleData.joyful ? false : true
    }
}
