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
    func fetchTitles(for media:String) async throws -> [Title] {
        guard let baseURL = tmdbBaseURL else {
            throw NetworkError.missingConfig
        }
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        
        guard let fetchTitlesURL = URL(string: baseURL)?
            .appending(path: "3/trending/\(media)/day")
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else {
            throw NetworkError.urlBuildFailed
        }
        
        print(fetchTitlesURL)
        
        let(data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "DataFetcher",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid response from server"]))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decoder.decode(APIObject.self, from: data).results // this allows us to modify the data before returning it. now we can run our posterPathURL function to it so that we can return the correct URLs from this
        Constants.addPosterPath(to: &titles) // the & tells Swift to modify the actual array
        return titles
    }
}
