//
//  SceneDelegate.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 12.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowsScene = (scene as? UIWindowScene) else { return }
    
    let networkManager: NetworkManagerProtocol = NetworkManager() as! NetworkManagerProtocol
    let rootViewController = CountriesListViewController(networkManager: networkManager)
    
    window = UIWindow(windowScene: windowsScene)
    window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    window?.makeKeyAndVisible()
  }
}
