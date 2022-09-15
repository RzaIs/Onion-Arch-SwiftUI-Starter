//
//  NetworkProviderProtocol.swift
//  CleanArchSwiftUI
//
//  Created by Rza Ismayilov on 21.08.22.
//

import Foundation

protocol NetworkProviderProtocol {
    func request<T: Decodable>(endpoint: String) async throws -> T
    func request(endpoint: String) async throws -> Void
}
