//
//  TickerData.swift
//  DOGE
//
//  Created by Dimitri Kirillov on 09/02/2021.
//

import Foundation

struct TickerData: Codable {
    let name: String
    let tickers: [Ticker]
}

struct Ticker: Codable {
    let base: Base
    let target: String
    let market: Market
    let last, volume: Double
}

enum Base: String, Codable {
    case dog = "DOG"
    case doge = "DOGE"
    case doge3L = "DOGE3L"
    case xdg = "XDG"
    
}
struct Market: Codable {
    let name, identifier: String
    let hasTradingIncentive: Bool
    
    enum CodingKeys: String, CodingKey {
        case name, identifier
        case hasTradingIncentive = "has_trading_incentive"
    }
}
