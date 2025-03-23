//
//  MovieDetail.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import Foundation

struct MovieDetail: Codable {
    var backdropPath: String?
    var originalTitle: String?
    var title: String?
    var overview: String?
    var releaseDate: String?
    var budget: Int?
    var revenue: Int?
    var voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case title = "title"
        case overview = "overview"
        case releaseDate = "release_date"
        case budget = "budget"
        case revenue = "revenue"
        case voteAverage = "vote_average"
    }
}
