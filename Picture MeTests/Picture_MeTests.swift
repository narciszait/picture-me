//
//  Picture_MeTests.swift
//  Picture MeTests
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright © 2019 Narcis Zait. All rights reserved.
//

import XCTest
@testable import Picture_Me

class Picture_MeTests: XCTestCase {
    var data: [Datum] = []

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfElementsFromServer() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let itemCount = 10
        let repository = APIClient()
        
        repository.fetchPosts { result in
            switch result {
            case .success(let data):
                if let datum = data.data {
                    self.data = datum
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssert(self.data.count == itemCount)
        }
    }
    
    func testNumberOfElementsNextPage() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let itemCount = 10
        let repository = APIClient()
        let nextPage = "2"
        
        repository.fetchNextPosts(nextPage) { result in
            switch result {
            case .success(let data):
                if let datum = data.data {
                    self.data = datum
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssert(self.data.count == itemCount)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
