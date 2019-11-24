//
//  APIClient.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright © 2019 Narcis Zait. All rights reserved.
//

import Foundation

let baseurlString = "https://backend-api.tattoodo.com/api/v2/"

struct APIClient {
    var fetchPosts = fetchPosts(completion: )
    var fetchNextPosts = fetchNextPosts(pageNumber: completion: )
    var fetchDetails = fetchDetails(forPost: completion: )
}

private func fetchPosts(completion: @escaping (Result<Search, Error>) -> Void) {
    dataTask("search/posts", parameters: [:], completionHandler: completion)
}

private func fetchNextPosts(pageNumber: String, completion: @escaping (Result<Search, Error>) -> Void) {
    dataTask("search/posts", parameters: ["page": pageNumber], completionHandler: completion)
}

private func fetchDetails(forPost postID: Int, completion: @escaping (Result<Search, Error>) -> Void) {
    dataTask("/posts/", parameters: ["":postID], completionHandler: completion)
}

private func dataTask<T: Decodable>(_ path: String, parameters: [String: Any] = [:], completionHandler: (@escaping (Result<T, Error>) -> Void)) {

    let request: URLRequest
    
    if parameters.isEmpty {
        request = URLRequest(url: URL(string: baseurlString + path)!)
    } else {
        let items: [URLQueryItem] = parameters.map { (arg) -> URLQueryItem in let (key, value) = arg; return URLQueryItem.init(name: key, value: "\(value)") }
        var comps = URLComponents.init(string: baseurlString + path)!
        comps.queryItems = items
        request = .init(url: comps.url!)

    }
    
    URLSession.shared.dataTask(with: request) { data, _, error in
        handleDataResponse(data: data, error: error, completion: completionHandler)
    }.resume()
}

private func handleDataResponse<Output: Decodable>(data: Data?, error: Error?, completion: @escaping (Result<Output, Error>) -> Void) {
    DispatchQueue.main.async {
        do {
            if let error = error {
                throw error
            } else if let data = data {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-ddTHH:mm:ss"
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.timeZone = TimeZone(secondsFromGMT: 0)
                
                let decoder = JSONDecoder()
                decoder.dataDecodingStrategy = .base64
                decoder.keyDecodingStrategy = .useDefaultKeys
                decoder.dateDecodingStrategy = .formatted(formatter) //.iso8601
                let result: Result<Output, Error> = .success(try decoder.decode(Output.self, from: data))
                completion(result)

            } else {
                fatalError()
            }
        } catch let finalError {
            completion(.failure(finalError))
        }
    }
}




