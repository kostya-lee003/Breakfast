//
//  DecodingService.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation
import RxSwift

class DecodingService {
    static func decode<T: Decodable>(from data: Data, type: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch let decodingError as DecodingError {
            switch decodingError {
            case .dataCorrupted(let context):
                print("Data corrupted error: \(context.debugDescription)")
            case .keyNotFound(let key, let context):
                print("Key not found error: \(key.stringValue), context: \(context.debugDescription)")
            case .typeMismatch(let type, let context):
                print("Type mismatch error: expected \(type), context: \(context.debugDescription)")
            case .valueNotFound(let value, let context):
                print("Value not found error: expected \(value), context: \(context.debugDescription)")
            @unknown default:
                print("Unknown decoding error: \(decodingError.localizedDescription)")
            }
            return nil
        } catch {
            print("General error: \(error.localizedDescription)")
            return nil
        }
    }
}
