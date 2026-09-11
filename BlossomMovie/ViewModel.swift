//
//  ViewModel.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 9/7/26.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    
    func getTitle() async {
        homeStatus = .fetching
        
        do {
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
 
