//
//  FavoritesMovieListFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import UIKit

class FavoritesMovieListFactory: SceneFactory {
    struct Dependencies {}
    static func build(with dependecies: Dependencies) -> UIViewController {
        let favoriteMovieWorker = FavoriteMovieWorker()
        let interactor = MovieListInteractor(worker: favoriteMovieWorker)
        
        let router = MovieListRouter()
        
        let presenter = FavoritesMovieListPresenter(interactor: interactor, router: router)
        interactor.output = presenter
        
        let movieListVC = MovieListViewController(presenter: presenter)
        presenter.output = movieListVC
        router.viewController = movieListVC
        
        
        return movieListVC
    }
}
