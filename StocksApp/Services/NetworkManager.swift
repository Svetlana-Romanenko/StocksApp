//
//  NetworkManager.swift
//  StocksApp
//
//  Created by Светлана Романенко on 06.03.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func requestData(for url: String?, completion: @escaping(Company) -> Void) {
        
        guard let stringUrl = url else { return }
        guard let url = URL(string: stringUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            self.fetchData(from: data)
        }.resume()
    }
    
    func fetchData(from data: Data) {
            do {
                let companyStock = try JSONSerialization.jsonObject(with: data)
                
                guard let company = companyStock as? [String: Any],
                      let companyName = company["companyName"] as? String,
                      let symbol = company["symbol"] as? String,
                      let sector = company["sector"] as? String,
                      let price = company["price"] as? Double,
                      let priceChange = company["priceChange"] as? Double else { return }
                
                DispatchQueue.main.async {
                    let company = Company(companyName: companyName,
                                          symbol: symbol,
                                          sector: sector,
                                          priceChage: price,
                                          price: priceChange)
                    let cell = TableViewCell()
                    cell.displayStockInfo(company: company)

                }
            } catch let error {
                print(error)
        }
    }
}
