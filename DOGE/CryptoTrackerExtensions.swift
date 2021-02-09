//
//  CryptoTrackerExtensions.swift
//  DOGE
//
//  Created by Dimitri Kirillov on 09/02/2021.
//

import Foundation

extension URL {
    func getFromPublisher<T: Codable>(property: inout Published<T>.Publisher) {
        URLSession.shared.dataTaskPublisher(for: self)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .print()
            .assertNoFailure()
            .assign(to: &property)
    }
}

extension Date {
    static var currentTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
}
