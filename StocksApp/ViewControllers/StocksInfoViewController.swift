//
//  StocksInfoViewController.swift
//  StocksApp
//
//  Created by Светлана Романенко on 06.03.2021.
//

import UIKit

class StocksInfoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceChangeLabel: UILabel!
    
    @IBOutlet var logoLabel: UIImageView!
    
    // MARK: - Public properties
    
    var company: Company?

    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.companyNameLabel.text = company?.companyName
        self.symbolLabel.text = company?.symbol
        self.priceLabel.text = "\(company?.price ?? 0)"
        self.priceChangeLabel.text = "\(company?.priceChage ?? 0)"
    }
}
