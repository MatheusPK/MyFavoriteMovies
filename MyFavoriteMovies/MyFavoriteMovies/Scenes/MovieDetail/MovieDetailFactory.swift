//
//  MovieDetailFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class MovieDetailFactory: SceneFactory {
    
    static func build() -> UIViewController {
        let movieDetailVC = MovieDetailViewController()
        return movieDetailVC
    }
    
}
