//
//  AbridgedFoodNutrient.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation

// Сокращенный
public struct AbridgedFoodNutrient: Decodable {
    public init(number: String? = nil, name: String? = nil, amount: Float? = nil, unitName: String? = nil, derivationCode: String? = nil, derivationDescription: String? = nil) {
        self.number = number
        self.name = name
        self.amount = amount
        self.unitName = unitName
        self.derivationCode = derivationCode
        self.derivationDescription = derivationDescription
    }
    
    let number: String?
    let name: String?
    let amount: Float?
    let unitName: String?
    let derivationCode: String?
    let derivationDescription: String?
}
