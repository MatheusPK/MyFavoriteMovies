//
//  MockNavigationController.swift
//  MyFavoriteMovies
//
//  Created by Matheus Pereira Kulick on 23/03/25.
//

import UIKit

final class MockNavigationController: UINavigationController {
    var pushViewControllerCalled = false
    var pushedViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        pushViewControllerCalled = true
        pushedViewController = viewController
    }
}
