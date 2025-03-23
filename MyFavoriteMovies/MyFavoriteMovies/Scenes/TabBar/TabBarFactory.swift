//
//  TabBarFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class TabBarFactory: SceneFactory {
    struct Dependencies {}
    
    static func build(with dependencies: Dependencies) -> UIViewController {
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.viewControllers = [buildSearchTab(), buildFavoritesTab()]
        return tabBarVC
    }
    
    private static func buildSearchTab() -> UIViewController {
        let searchVC = SearchFactory.build(with: .init())
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    private static func buildFavoritesTab() -> UIViewController {
        let favoritesVC = MovieListFactory.build(with: .init(movies: []))
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
        return UINavigationController(rootViewController: favoritesVC)
    }
    
}
