//
//  DataFetcher.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 8/30/26.
//

import Foundation

struct DataFetcher {
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    // https://api.themoviedb.org/3/trending/movie/day?api_key=YOUR_API_KEY
    // https://api.themoviedb.org/3/movie/top_rated?api_key=YOUR_API_KEY
    
    func fetchTitles(for media:String, by type: String) async throws -> [Title] {
        
        let fetchTitlesURL = try buildURL(media: media, type: type)
        guard let fetchTitlesURL = fetchTitlesURL else {
            throw NetworkError.urlBuildFailed
        }
        
        print(fetchTitlesURL)
        
        let(data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decoder.decode(APIObject.self, from: data).results // this allows us to modify the data before returning it. now we can run our posterPathURL function to it so that we can return the correct URLs from this
        Constants.addPosterPath(to: &titles) // the & tells Swift to modify the actual array
        return titles
    }
    
    private func buildURL(media: String, type: String) throws -> URL? {
        guard let baseURL = tmdbBaseURL else {
            throw NetworkError.missingConfig
        }
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        
        var path: String // will be used to construct the correct URL, based on the type
        
        if type == "trending" {
            path = "3/trending/\(media)/day"
        } else if type == "top_rated" {
            path = "3/\(media)/top_rated"
        } else {
            throw NetworkError.urlBuildFailed
        }
        
        guard let url = URL(string: baseURL)?
            .appending(path: path)
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else {
            throw NetworkError.urlBuildFailed
        }
        
        return url
    }
}
