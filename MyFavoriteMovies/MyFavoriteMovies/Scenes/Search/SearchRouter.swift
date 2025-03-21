//
//  SearchRouter.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 21/03/25.
//

import UIKit

protocol SearchRouterProtocol {
    func goToMovieList(movies: [String])
}

class SearchRouter: SearchRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func goToMovieList(movies: [String]) {
        let vc = MovieListFactory.build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
