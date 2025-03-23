//
//  Movie.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import Foundation

struct MoviesResult: Codable {
    let results: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

struct Movie: Codable, Equatable {
    let id: Int?
    let originalTitle: String?
    let posterPath: String?
    let voteAverage: Double?
    
    init(id: Int? = nil, originalTitle: String? = nil, posterPath: String? = nil, voteAverage: Double? = nil) {
        self.id = id
        self.originalTitle = originalTitle
        self.posterPath = posterPath
        self.voteAverage = voteAverage
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
    }
}
