//
//  HomeFactory.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 26/04/24.
//

import Foundation
import UIKit

enum HomeFactory {
    static func makeModule() -> UIViewController {
        let service = NetworkService()
        let viewModel = HomeViewModel(networkService: service)
        let viewController = HomeViewController(homeView: viewModel)
        return viewController
    }
}
