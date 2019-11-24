//
//  HomePresenter.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation

class HomePresenter {
    let interactor: HomeInteractorInput
    weak var coordinator: HomeCoordinatorInput?
    weak var output: HomePresenterOutput?
    
    var meta: Meta?
    var homeItems: [HomeItem] = []
    var searchResponse: [Datum] = []

    init(interactor: HomeInteractorInput, coordinator: HomeCoordinatorInput) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

// MARK: - User Events -

extension HomePresenter: HomePresenterInput {
    func viewCreated() {
        interactor.perform(Home.Request.SearchRequest())
    }
    
    func handle(action: Home.Action) {
        switch action {
        case .loadMoreItems:
            guard let meta = meta else { return }
            interactor.perform(Home.Request.NextSearchRequest(meta: meta))
        case .itemSelected(let row):
            let item = searchResponse[row]
            let detailItem = DetailItem(artistName: item.artist?.name ?? "Undiscovered",
                                        hashtags: item.classification?.hashtags ?? ["no hashtags to show"],
                                        motifs: item.classification?.motifs ?? ["no motifs to show"],
                                        shopName: item.shop?.name ?? "Secret shop",
                                        artistReviews: [
                "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."],
                                        country: item.shop?.address?.country ?? "🌍",
                                        imageUrl: item.shop?.portfolioPreview?.first?.image?.url ?? "https://bit.ly/34p9Hhi")
            coordinator?.navigate(route: .showDetail(detailItem: detailItem))
                
        }
    }
    
    var numberOfItems: Int {
        return homeItems.count
    }
    
    func configure(item: HomeItemProtocol, at indexPath: IndexPath) {
        let homeItem = homeItems[indexPath.row]
        
        item.configure(artistName: homeItem.artistName, shopName: homeItem.shopName, country: homeItem.country, imageUrl: homeItem.imageUrl)
    }
}

// MARK: - Presentation Logic -

// INTERACTOR -> PRESENTER (indirect)
extension HomePresenter: HomeInteractorOutput {
    func present(_ response: Home.Response.SearchResult) {
        if let meta = response.result.meta {
            self.meta = meta
        }
        
        if let searchData = response.result.data {
            homeItems = searchData.map { HomeItem(artistName: $0.artist?.name ?? "Undiscovered",
                                                  shopName: $0.shop?.name ?? "Secret shop",
                                                  country: $0.shop?.address?.country ?? "🌍",
                                                  imageUrl: $0.shop?.portfolioPreview?.first?.image?.url ?? "https://bit.ly/34p9Hhi")}
            searchResponse = searchData
        } else {
            homeItems = []
        }
        output?.display(Home.DisplayData.Search())
    }
    
    func present(_ response: Home.Response.NextSearchResult) {
        if let meta = response.result.meta {
            self.meta = meta
        }
        
        if let searchData = response.result.data {
            let nextResults = searchData.map { HomeItem(artistName: $0.artist?.name ?? "Undiscovered",
                                                  shopName: $0.shop?.name ?? "Secret shop",
                                                  country: $0.shop?.address?.country ?? "🌍",
                                                  imageUrl: $0.shop?.portfolioPreview?.first?.image?.url ?? "https://bit.ly/34p9Hhi")}
            homeItems += nextResults
            searchResponse += searchData
            output?.display(Home.DisplayData.Search())
        }
    }
    
    func present(_ response: Home.Response.Error) {
        output?.display(Home.DisplayData.Error(message: response.message))
    }
}
