//
//  SearchRouter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import UIKit

protocol SearchRouterProtocol {
    func goToMovieList(movies: [Movie])
}

class SearchRouter: SearchRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func goToMovieList(movies: [Movie]) {
        DispatchQueue.main.async { [weak self] in
            let vc = MovieListFactory.build()
            self?.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
