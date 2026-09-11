//
//  Title.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 8/24/26.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}

struct Title: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "We Live In Time", name: "We Live In Time", overview: "A movie about living in time.", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Marty Supreme", name: "Marty Supreme", overview: "A movie about Marth Supreme.", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "Aftersun", name: "Aftersun", overview: "A movie about a girl and her dad.", posterPath: Constants.testTitleURL3)
    ]
}
 
