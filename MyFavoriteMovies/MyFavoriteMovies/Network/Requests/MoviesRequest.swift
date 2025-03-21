//
//  MoviesRequest.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import Foundation

enum MoviesRequest {
    case movies(term: String)
    
    var apiKey: String {
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzI3NTdmYzYzM2ExMGJiMTU0NzM5OTk4MTFhMmI2MCIsIm5iZiI6MTc0MjU2MzQyNC43ODgsInN1YiI6IjY3ZGQ2ODYwZDY4MTA0NTI3OTY5OGVlZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KJNXSRNTnlx0WCcB5hwPePWVt5BDJjSbtZCwRlhuj1Y"
    }
}

extension MoviesRequest: Request {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .movies: return "/3/search/movie"
        }
    }
    
    var headers: [String: String] {
        ["Authorization": "Bearer \(apiKey)"]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .movies(let term):
            return [URLQueryItem(name: "query", value: term)]
        }
    }
    
    var body: Data? {
        nil
    }
    
    var method: HTTPMethod {
        .GET
    }
}
