//
//  TableViewCell.swift
//  StocksApp
//
//  Created by Светлана Романенко on 07.03.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Public methods
    
    func displayStockInfo(company: Company) {
        var content = defaultContentConfiguration()
        content.text = company.companyName
        content.secondaryText = "\(company.priceChage)"
        self.contentConfiguration = content
    }
}
