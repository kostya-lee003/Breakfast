//
//  SearchResult.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

struct SearchResult: Decodable {
    let foodSearchCriteria: FoodSearchCriteria
    let totalHits: Int
    let currentPage: Int
    let totalPages: Int
    let foods: [SearchResultFood]
}
