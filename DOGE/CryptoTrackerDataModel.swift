//
//  CryptoTrackerDataModel.swift
//  DOGE
//
//  Created by Dimitri Kirillov on 09/02/2021.
//

import Combine
import Foundation
import UIKit

class DataModel: ObservableObject {
    static let url = URL(string: "https://api.coingecko.com/api/v3/coins/dogecoin/tickers")!
    static let imageURL = URL(string: "https://cnet3.cbsistatic.com/img/JdgcCFyRIZTnn8VtrEGYt0Ccn2k=/940x0/2013/12/27/292438ab-8533-11e3-bc97-14feb5ca9861/dogecoin.jpg")!
    @Published var tickerData: TickerData?
    @Published var image: UIImage?
    @Published var lastRefreshed = ""
    
    func refresh() {
        Self.url.getFromPublisher(property: &$tickerData)
        lastRefreshed = "Last refreshed: \(Date.currentTime)"
    }
    
    init() {
        if let data = try? Data(contentsOf: Self.imageURL) {
            image = UIImage(data: data)
        }
        refresh()
    }
}
