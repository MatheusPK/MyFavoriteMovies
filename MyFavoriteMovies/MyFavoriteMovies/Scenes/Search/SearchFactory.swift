//
//  SearchFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class SearchFactory: SceneFactory {
    
    static func build() -> UIViewController {
        let searchVC = SearchViewController()
        return searchVC
    }
    
}
