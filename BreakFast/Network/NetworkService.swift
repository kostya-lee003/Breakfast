//
//  NetworkService.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation
import RxSwift

class NetworkService {
    
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T: Decodable>(url: URL, type: T.Type) -> Single<T> {
        return Single.create { single in
            let task = self.session.dataTask(with: url) { data, response, error in
                if let error = error {
                    single(.failure(error))  // Emit error in Single
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    let statusCodeError = NSError(domain: "NetworkError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
                    single(.failure(statusCodeError))  // Emit error for invalid response
                    return
                }
                
                guard let data = data else {
                    let noDataError = NSError(domain: "NetworkError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])
                    single(.failure(noDataError))  // Emit error for missing data
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    single(.success(decodedData))  // Emit success with decoded data
                } catch {
                    single(.failure(error))  // Emit error for decoding failure
                }
            }
            
            task.resume()
            
            return Disposables.create { task.cancel() }
        }
    }
}
