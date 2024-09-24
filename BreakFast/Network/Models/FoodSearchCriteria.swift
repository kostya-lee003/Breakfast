//
//  FoodSearchCriteria.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

struct FoodSearchCriteria: Decodable {
    let query: String
    let dataType: [String]
    let pageSize: Int
    let pageNumber: Int
    let sortBy: String?
    let sortOrder: String?
    let brandOwner: String?
    let tradeChannel: [String]?
    let startDate: String?
    let endDate: String?
}
