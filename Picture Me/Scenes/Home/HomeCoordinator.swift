//
//  HomeCoordinator.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
    var repository: APIClient

    init(navigationController: UINavigationController, repository: APIClient) {
        self.navigationController = navigationController
        self.repository = repository
    }

    func start() {
        let interactor = HomeInteractor(repository: repository)
        let presenter = HomePresenter(interactor: interactor, coordinator: self)
        let vc = HomeViewController.instantiate(with: presenter)

        interactor.output = presenter
        presenter.output = vc
        
        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func presentDetailScreen(detailItem: DetailItem) {
        let interactor = DetailInteractor(repository: repository)
        let presenter = DetailPresenter(interactor: interactor, coordinator: self, detailItem: detailItem)
        let vc = DetailViewController.instantiate(with: presenter)
        
        interactor.output = presenter
        presenter.output = vc
        
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
}

// PRESENTER -> COORDINATOR
extension HomeCoordinator: HomeCoordinatorInput {
    func navigate(route: Home.Route) {
        switch route {
        case .showDetail(let detailItem):
            presentDetailScreen(detailItem: detailItem)
        }
    }
}
