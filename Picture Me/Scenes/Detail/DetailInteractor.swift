//
//  DetailInteractor.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation

class DetailInteractor {
    weak var output: DetailInteractorOutput?
    
    let repository: APIClient
    
    init(repository: APIClient) {
        self.repository = repository
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension DetailInteractor: DetailInteractorInput {
    func perform(_ request: Detail.Request.Item) {
//        repository.fetchDetails(request.itemId) { result in
//            switch result {
//            case .success(let data):
//                print("data we got for detail item")
//            case .failure(let error):
//                print("error we got for detail item \(error.localizedDescription)")
//            }
//        }
    }
}
