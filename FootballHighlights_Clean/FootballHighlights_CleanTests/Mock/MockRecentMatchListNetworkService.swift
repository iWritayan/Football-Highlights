//
//  MockRecentMatchListNetworkService.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation
@testable import FootballHighlights_Clean

final class MockRecentMatchListNetworkService: RecentMatchListNetworkService {
    var mockRecentMatchDataDTO: [RecentMatchDataDTO] = []
    var mockError: Error?
    
    func fetch() async throws -> [RecentMatchDataDTO] {
        if let error = mockError {
            throw error
        }
        return mockRecentMatchDataDTO
    }
}
