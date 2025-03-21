//
//  RequestError.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

enum RequestError: Error {
    case invalidURL
    case decodingFailed
    case connectionFailed
}
