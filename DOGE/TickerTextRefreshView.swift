//
//  TickerTextRefreshView.swift
//  DOGE
//
//  Created by Dimitri Kirillov on 09/02/2021.
//

import SwiftUI

struct TickerTextRefreshView: View {
    let ticker: Ticker
    
    var body: some View {
        Group {
            Text(ticker.market.name)
            Text("""
                \(ticker.base.rawValue) <-> \(ticker.target)
                \(ticker.last)
                """)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("Volume : \(ticker.volume)")
        }
    }
}

struct RefreshView: View {
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
        Group {
            Button("Refresh", action: dataModel.refresh)
            Text(dataModel.lastRefreshed)
        }
    }
}
