//
//  ListFactory.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 05/05/24.
//

import UIKit

enum ListFactory {
    static func makeModule() -> UIViewController {
        let service = NetworkService()
        let viewModel = ListViewModel(service: service)
        let viewController = ListViewController(viewModel: viewModel)
        return viewController
    }
}
