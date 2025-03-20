//
//  TabBarFactory.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 20/03/25.
//

import UIKit

class TabBarFactory: SceneFactory {
    
    static func build() -> UIViewController {
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.unselectedItemTintColor = .gray
        tabBarVC.tabBar.backgroundColor = .black
        tabBarVC.viewControllers = [buildSearchTab(), buildFavoritesTab()]
        return tabBarVC
    }
    
    private static func buildSearchTab() -> UIViewController {
        let searchVC = SearchFactory.build()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    private static func buildFavoritesTab() -> UIViewController {
        let favoritesVC = MovieListFactory.build()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
        return UINavigationController(rootViewController: favoritesVC)
    }
    
}
