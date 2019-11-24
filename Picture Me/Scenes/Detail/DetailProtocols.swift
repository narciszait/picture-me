//
//  DetailProtocols.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

// PRESENTER -> COORDINATOR
protocol DetailCoordinatorInput: class {

}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol DetailInteractorInput {
//    func perform(_ request: Detail.Request.Item)
}

// INTERACTOR -> PRESENTER (indirect)
protocol DetailInteractorOutput: class {
    
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol DetailPresenterInput {
    func viewCreated()
    
    var imageUrl: String { get }
    var title: String { get }
    var artistName: String { get }
    var country: String { get }
    var hashtags: [String] { get }
    var motifs: [String] { get }
    var reviewExample: [String] {get }
}

// PRESENTER -> VIEW
protocol DetailPresenterOutput: class {
    
}
