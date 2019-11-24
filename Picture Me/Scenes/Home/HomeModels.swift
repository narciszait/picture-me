//
//  HomeModels.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright (c) 2019 Narcis Zait. All rights reserved.
//

import Foundation

enum Home {
    enum Action {
        case loadMoreItems
        case itemSelected(row: Int)
    }
    
    enum Route {
        case showDetail(detailItem: DetailItem)
    }
    enum Request { }
    enum Response { }
    enum DisplayData { }
}

extension Home.Action {

}

extension Home.Request {
    struct SearchRequest { }
    struct NextSearchRequest {
        let meta: Meta
    }
}

extension Home.Response {
    struct SearchResult {
        let result: Search
    }
    
    struct NextSearchResult {
        let result: Search
    }
    
    struct Error {
        let message: String
    }
}

extension Home.DisplayData {
    struct Search { }
    
    struct Error {
        let message: String
    }
}
