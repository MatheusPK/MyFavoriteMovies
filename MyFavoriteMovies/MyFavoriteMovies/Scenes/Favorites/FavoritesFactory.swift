//
//  FavoritesFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import UIKit

class FavoritesFactory: SceneFactory {
    
    struct Dependencies {
        let movies: [Movie]
    }
    
    static func build(with dependecies: Dependencies) -> UIViewController {
        let favoriteMovieWorker = FavoriteMovieWorker()
        let interactor = MovieListInteractor(worker: favoriteMovieWorker)
        
        let router = MovieListRouter()
        
        let presenter = FavoritesPresenter(movies: dependecies.movies, interactor: interactor, router: router)
        interactor.output = presenter
        
        let movieListVC = MovieListViewController(presenter: presenter)
        presenter.output = movieListVC
        router.viewController = movieListVC
        
        
        return movieListVC
    }
    
}
