//
//  HomeProtocols.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

// PRESENTER -> COORDINATOR
protocol HomeCoordinatorInput: class {
    func navigate(route: Home.Route)
}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol HomeInteractorInput {
    func perform(_ request: Home.Request.SearchRequest)
    func perform(_ request: Home.Request.NextSearchRequest)
}

// INTERACTOR -> PRESENTER (indirect)
protocol HomeInteractorOutput: class {
    func present(_ response: Home.Response.SearchResult)
    func present(_ response: Home.Response.NextSearchResult)
    func present(_ response: Home.Response.Error)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol HomePresenterInput {
    func viewCreated()
    func handle(action: Home.Action)
    
    var numberOfItems: Int { get }
    func configure(item: HomeItemProtocol, at indexPath: IndexPath)
}

// PRESENTER -> VIEW
protocol HomePresenterOutput: class {
    func display(_ displayModel: Home.DisplayData.Search)
    func display(_ error: Home.DisplayData.Error)
}
