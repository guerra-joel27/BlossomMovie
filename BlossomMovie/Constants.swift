//
//  Constants.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 8/22/26.
//

import Foundation
import SwiftUI

struct Constants {
    static let homeString = "Home"
    static let upcomingString = "Upcoming"
    static let searchString = "Search"
    static let downloadString = "Download"
    static let playString = "Play"
    static let trendingMovieString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMovieString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated TV"
    
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadIconString = "arrow.down.to.line"
    
    static let testTitleURL = "https://www.movieposters.com/cdn/shop/files/scan_7b02eb84-e046-472f-8c4a-f91d157d0ea7_1024x1024.jpg?v=1762977125" // We Live In Time
    static let testTitleURL2 = "https://www.movieposters.com/cdn/shop/files/marty-supreme_ozlejkxr_0c1cce34-743c-4c79-be65-5604d60bfea9_1024x1024.jpg?v=1764013999" // Marty Supreme
    static let testTitleURL3 = "https://image.tmdb.org/t/p/original/hcGyKiQo6x9AL5GlssgBW3OAB4v.jpg" // Aftersun
    static let testTitleURL4 = "https://image.tmdb.org/t/p/original/qmXQlIlL9Lo21HrJXTD6knUbJn.jpg" // Beautiful Boy
    
    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
    
    static func addPosterPath(to titles: inout[Title]) {
        for index in titles.indices {
            if let path = titles[index].posterPath {
                titles[index].posterPath = Constants.posterURLStart + path
            }
        }
    }
}

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}
