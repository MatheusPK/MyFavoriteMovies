//
//  FavoriteMoviesWorker.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 22/03/25.
//

// FavoriteMovieWorker.swift
import Foundation

protocol FavoriteMoviesWorkerProtocol {
    func toggleFavorite(movie: Movie)
    func getFavorites() -> [Movie]
}

class FavoriteMovieWorker: FavoriteMoviesWorkerProtocol {
    private let favoritesKey = "favoriteMovies"
    
    func isFavorite(movie: Movie) -> Bool {
        return getFavorites().contains(where: { $0.id == movie.id })
    }

    func toggleFavorite(movie: Movie) {
        if isFavorite(movie: movie) {
            let favorites = getFavorites().filter({ $0.id != movie.id })
            saveFavorites(favorites)
            return
        }
        
        let favorites = getFavorites() + [movie]
        saveFavorites(favorites)
    }

    func getFavorites() -> [Movie] {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let savedMovies = try? JSONDecoder().decode([Movie].self, from: data) {
            return savedMovies
        }
        return []
    }

    private func saveFavorites(_ favorites: [Movie]) {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
}
