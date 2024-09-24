//
//  SceneDelegate.swift
//  BreakFast
//
//  Created by Kostya Lee on 23/09/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController(rootViewController: ProductListViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

