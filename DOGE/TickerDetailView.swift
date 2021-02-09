//
//  TickerDetailView.swift
//  DOGE
//
//  Created by Dimitri Kirillov on 09/02/2021.
//

import SwiftUI

struct TickerDetailView: View {
    @EnvironmentObject var dataModel: DataModel
    let index: Int
    
    var body: some View {
        Group {
            if let image = dataModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            if let ticker = dataModel.tickerData?.tickers[index] {
                TickerTextRefreshView(ticker: ticker)
            }
            Spacer()
            RefreshView()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.white)
        .foregroundColor(.black)
    }
}

//struct TickerDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TickerDetailView()
//    }
//}
