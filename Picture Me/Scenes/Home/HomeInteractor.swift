//
//  HomeInteractor.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation

class HomeInteractor {
    weak var output: HomeInteractorOutput?
    let repository: APIClient
    
    init(repository: APIClient) {
        self.repository = repository
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension HomeInteractor: HomeInteractorInput {
    func perform(_ request: Home.Request.SearchRequest) {
        repository.fetchPosts { result in
            switch result {
            case .success(let data):
                self.output?.present(Home.Response.SearchResult(result: data))
            case .failure(let error):
                self.output?.present(Home.Response.Error(message: error.localizedDescription))
            }
        }
    }
    
    func perform(_ request: Home.Request.NextSearchRequest) {
        guard let nextUrl = request.meta.pagination?.links?.next else { return }
        let pageNumber = String(nextUrl.last ?? "0")
        repository.fetchNextPosts(pageNumber) { result in
            switch result {
            case .success(let data):
                self.output?.present(Home.Response.NextSearchResult(result: data))
            case .failure(let error):
                self.output?.present(Home.Response.Error(message: error.localizedDescription))
            }
        }
    }
}
