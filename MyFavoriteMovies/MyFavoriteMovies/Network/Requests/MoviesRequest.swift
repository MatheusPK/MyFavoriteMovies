//
//  MoviesRequest.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import Foundation

enum MoviesRequest {
    case movies(term: String)
    case image(path: String)
    case detail(id: Int)
    
    var apiKey: String {
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzI3NTdmYzYzM2ExMGJiMTU0NzM5OTk4MTFhMmI2MCIsIm5iZiI6MTc0MjU2MzQyNC43ODgsInN1YiI6IjY3ZGQ2ODYwZDY4MTA0NTI3OTY5OGVlZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KJNXSRNTnlx0WCcB5hwPePWVt5BDJjSbtZCwRlhuj1Y"
    }
}

extension MoviesRequest: Request {
    var scheme: String {
        "https"
    }
    
    var host: String {
        switch self {
        case .movies, .detail:
            return "api.themoviedb.org"
        case .image:
            return "image.tmdb.org"
        }
        
    }
    
    var path: String {
        switch self {
        case .movies: return "/3/search/movie"
        case .image(let path): return "/t/p/original/\(path)"
        case .detail(let id): return "/3/movie/\(id)"
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .movies, .detail: return ["Authorization": "Bearer \(apiKey)"]
        case .image: return [:]
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .movies(let term):
            return [URLQueryItem(name: "query", value: term)]
        case .image, .detail:
            return []
        }
    }
    
    var body: Data? {
        nil
    }
    
    var method: HTTPMethod {
        .GET
    }
}
