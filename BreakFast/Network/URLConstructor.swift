//
//  URLConstructor.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

class URLConstructor {
    private let base = "https://api.nal.usda.gov/"

    private var parameters: [String: Any]
    
    init() {
        self.parameters = [:]
    }
    
    func foodsList() -> URL? {
        let urlString = base + "fdc/v1/foods/list"
        parameters = [
            "api_key": "DEMO_KEY",
    //        "dataType": ["Foundation", "SR Legacy"].joined(separator: ","),
            "dataType": "",
            "pageSize": 15,
            "pageNumber": 1,
            "sortBy": "dataType.keyword",
//            "sortOrder": "asc"
            "sortOrder": ""
        ]

        guard var urlComponents = URLComponents(string: urlString) else {
            return nil
        }
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }

        guard let url = urlComponents.url else {
            return nil
        }
        
        return url
    }
    
    func search(_ text: String) -> URL? {
        let urlString = base + "fdc/v1/foods/search?"
        parameters = [
            "api_key": "DEMO_KEY",
            "query" : text,
            "dataType": "",
            "pageSize": 15,
            "pageNumber": 1,
            "sortBy": "dataType.keyword",
            "sortOrder": "asc",
            "brandOwner": ""
        ]

        guard var urlComponents = URLComponents(string: urlString) else {
            return nil
        }
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }

        guard let url = urlComponents.url else {
            return nil
        }
        
        return url
    }
}
