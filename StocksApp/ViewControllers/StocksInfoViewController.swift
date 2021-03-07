//
//  StocksInfoViewController.swift
//  StocksApp
//
//  Created by Светлана Романенко on 06.03.2021.
//

import UIKit
import Alamofire

class StocksInfoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceChangeLabel: UILabel!
    
    // MARK: - Public properties
    
    var company: Company?
    var listVC = StocksListTableViewController()

    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.companyNameLabel.text = company?.companyName
        self.symbolLabel.text = company?.symbol
        self.priceLabel.text = "\(company?.price ?? 0)"
        self.priceChangeLabel.text = "\(company?.priceChage ?? 0)"
    }
    
    @IBAction func requestButton() {
    }
    
    private func afRequestButtonPressed() {
        let company = Company(companyName: "Procter&Gamble",
                              symbol: "PG",
                              sector: "Basic Industries",
                              priceChage: 3.83,
                              price: 125.98)
        AF.request(URL(string: "https://cloud.iexapis.com/stable/stock/PG/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b")!,
                   method: .post,
                   parameters: company)
            .validate()
            .responseDecodable(of: Company.self) { responseData in
                switch responseData.result {
                case .success(let companyPG):
                    let company = Company(companyName: companyPG.companyName,
                                          symbol: companyPG.symbol,
                                          sector: companyPG.sector,
                                          priceChage: companyPG.priceChage,
                                          price: companyPG.price)
                   
                    self.listVC.companies.append(company)
                    DispatchQueue.main.async {
                        self.listVC.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
