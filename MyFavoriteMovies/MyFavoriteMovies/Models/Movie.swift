//
//  Movie.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import Foundation

struct MoviesResult: Codable {
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

struct Movie: Codable {
    let posterPath: String?
    let adult: Bool?
    let overview, releaseDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle, originalLanguage, title, backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}
