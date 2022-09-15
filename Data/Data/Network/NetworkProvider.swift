//
//  NetworkProvider.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import Foundation
import Alamofire

class NetworkProvider: NetworkProviderProtocol {
    
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func request<T: Decodable>(endpoint: String) async throws -> T {
        return try await withUnsafeThrowingContinuation { continuation in
            AF.request("\(baseURL)/\(endpoint)").responseDecodable(of: T.self) { response in
                if let value = response.value {
                    continuation.resume(returning: value)
                } else if let error = response.error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: NSError(domain: "network", code: 1))
                }
            }
        }
    }
    
    func request(endpoint: String) async throws -> Void {
        return try await withUnsafeThrowingContinuation { continuation in
            AF.request("\(baseURL)/\(endpoint)").response { response in
                if let error = response.error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: Void())
                }
            }
        }
    }
    
    
}
