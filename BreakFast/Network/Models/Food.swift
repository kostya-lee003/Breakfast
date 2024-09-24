//
//  Food.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

struct SearchResultFood: Decodable {
    let fdcId: Int
    let dataType, description: String
    let foodCode: String?
    let foodNutrients: [AbridgedFoodNutrient]?
    let publicationDate: String?
    let scientificName: String?
    let brandOwner: String?
    let gtinUpc: String?
    let ingredients: String?
    let ndbNumber: String?
    let additionalDescriptions: String?
    let allHighlightFields: String?
    let score: Float?
}
