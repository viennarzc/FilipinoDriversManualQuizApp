//
//  APIClientProtocol.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import Foundation

// Protocol defining the API client operations
protocol APIClientProtocol {
    func fetchDataObject<T: Decodable>(from url: URL) async throws -> T
    func fetchDataArray<T: Decodable>(from url: URL) async throws -> [T]

}
