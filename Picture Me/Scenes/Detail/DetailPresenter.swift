//
//  DetailPresenter.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation

class DetailPresenter {
    let interactor: DetailInteractorInput
    weak var coordinator: HomeCoordinatorInput?
    weak var output: DetailPresenterOutput?
    var detailItem: DetailItem

    init(interactor: DetailInteractorInput, coordinator: HomeCoordinatorInput, detailItem: DetailItem) {
        self.interactor = interactor
        self.coordinator = coordinator
        self.detailItem = detailItem
    }
}

// MARK: - User Events -

extension DetailPresenter: DetailPresenterInput {
    func viewCreated() {
        
    }
    
    var imageUrl: String {
        return detailItem.imageUrl
    }
    
    var title: String {
        return detailItem.artistName
    }
    
    var artistName: String {
        return detailItem.artistName
    }
    
    var country: String {
        return detailItem.country
    }
    
    var hashtags: [String] {
        return detailItem.hashtags
    }
    
    var motifs: [String] {
        return detailItem.motifs
    }
    
    var reviewExample: [String] {
        return detailItem.artistReviews
    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension DetailPresenter: DetailInteractorOutput {

}
