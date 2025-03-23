//
//  MovieListRouter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import UIKit

protocol MovieListRouterProtocol {
    func navigateToDetail(movieId: Int)
}

class MovieListRouter: MovieListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func navigateToDetail(movieId: Int) {
        DispatchQueue.main.async { [weak self] in
            let vc = MovieDetailFactory.build(with: .init())
            self?.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
