//
//  Company.swift
//  StocksApp
//
//  Created by Светлана Романенко on 06.03.2021.
//

import Foundation

struct Company: Codable {
    let companyName: String
    let symbol: String
    let sector: String
    let priceChage: Double
    let price: Double
//    var url: String {
//        let symbol = self.symbol.rawValue
//        return "https://cloud.iexapis.com/stable/stock/\(symbol)/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
//    }
}
enum URLs: String, CaseIterable {
    case apple = "https://cloud.iexapis.com/stable/stock/AAPL/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case microsoft = "https://cloud.iexapis.com/stable/stock/MSFT/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case amazom = "https://cloud.iexapis.com/stable/stock/AMZN/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case alphabet = "https://cloud.iexapis.com/stable/stock/GOOG/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case facebook = "https://cloud.iexapis.com/stable/stock/FB/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case alibaba = "https://cloud.iexapis.com/stable/stock/BABA/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case tesla = "https://cloud.iexapis.com/stable/stock/TSLA/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case visa = "https://cloud.iexapis.com/stable/stock/V/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case netflix = "https://cloud.iexapis.com/stable/stock/NFLX/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case adobe = "https://cloud.iexapis.com/stable/stock/ADBE/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case nike = "https://cloud.iexapis.com/stable/stock/NKE/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case toyota = "https://cloud.iexapis.com/stable/stock/TM/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case mastercard = "https://cloud.iexapis.com/stable/stock/MA/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case disney = "https://cloud.iexapis.com/stable/stock/DIS/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case payPal = "https://cloud.iexapis.com/stable/stock/PYPL/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
    case intel = "https://cloud.iexapis.com/stable/stock/INTC/quote?token=pk_5949bbf8a9a5406387e6e322dd2f1c1b"
}

//enum Symbols: String, CaseIterable {
//    case apple = "AAPL"
//    case microsoft = "MSFT"
//    case amazom = "AMZN"
//    case alphabet = "GOOG"
//    case facebook = "FB"
//    case alibaba = "BABA"
//    case tesla = "TSLA"
//    case visa = "V"
//    case netflix = "NFLX"
//    case adobe = "ADBE"
//    case nike = "NKE"
//    case toyota = "TM"
//    case mastercard = "MA"
//    case disney = "DIS"
//    case payPal = "PYPL"
//    case intel = "INTC"
//}
