//
//  CryptoTrackerContentView.swift
//  DOGE
//
//  Created by Dimitri Kirillov on 09/02/2021.
//

import SwiftUI

struct CryptoTrackerContentView: View {
    @StateObject var dataModel = DataModel()
    var body: some View {
        if let tickers = dataModel.tickerData?.tickers
            .sorted(by: { $0.market.name < $1.market.name }) {
            NavigationView {
                List(0..<tickers.count) { index in
                    if let ticker = tickers[index] {
                        NavigationLink(destination: TickerDetailView(index: index)
                                        .environmentObject(dataModel)) {
                            Text("""
                                    \(ticker.market.name)
                                    \(ticker.base.rawValue) \(ticker.target)
                                """)
                        }
                    }
                }
                .navigationTitle("DOGE")
            }
        }
    }
}
