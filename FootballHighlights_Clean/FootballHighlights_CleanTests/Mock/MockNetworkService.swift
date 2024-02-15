//
//  MockNetworkService.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation
import NetworkManager
@testable import FootballHighlights_Clean

final class MockNetworkService: NetworkService {
    var mockData: Data?
    var mockError: Error?

    func fetchDataFor<Request: DataRequest>(request: Request) async throws -> Request.ResponseData {
        if let error = mockError {
            throw error
        }
        return try request.decode(mockData!)
    }
}

