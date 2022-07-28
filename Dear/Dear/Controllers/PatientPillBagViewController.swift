//
//  PatientPillBagViewController.swift
//  Dear
//
//  Created by Tempnixk on 2022/07/26.
//

import UIKit

class PatientPillBagViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var pillBag: UIStackView!
    
    @IBOutlet weak var sentPrescription: UIButton!
    
    @IBOutlet weak var pillBagTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pillBagTable.dataSource = self
        pillBagTable.delegate = self
        pillBag.layer.cornerRadius = 23
        pillBag.backgroundColor = UIColor.orange

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "pillCell")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "pillCell", for: indexPath) as! PatientPillBagTableViewCell
        cell.month.text = "Jul"
        cell.date.text = "24"
        cell.day.text = "Sunday"
        cell.title.text = "기분이 좋아지는 약"
        cell.toNurse.text = "A 간호사님"
        return cell
    }
    
}

extension PatientPillBagViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
}

extension UIView {
   func createDottedLine(width: CGFloat, color: CGColor) {
      let caShapeLayer = CAShapeLayer()
      caShapeLayer.strokeColor = color
      caShapeLayer.lineWidth = width
      caShapeLayer.lineDashPattern = [10,5]
      let cgPath = CGMutablePath()
       let cgPoint = [CGPoint(x: 330, y: 30), CGPoint(x: 330, y: 230)]
      cgPath.addLines(between: cgPoint)
      caShapeLayer.path = cgPath
      layer.addSublayer(caShapeLayer)
   }
}
