//
//  CardDetailViewController.swift
//  Dear
//
//  Created by Jeon Jimin on 2022/07/20.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var cardTitle: UILabel!
    @IBOutlet var cardContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backgroundView.layer.cornerRadius = 10
        
        
    }
    
    
}
