//
//  MockRecentMatchListRespository.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation
@testable import FootballHighlights_Clean

final class MockRecentMatchListRespository: RecentMatchListRespository {
    var mockRecentMatchDomainDTO: [RecentMatchDomainDTO] = []
    var mockError: Error?
    
    func fetch() async throws -> [RecentMatchDomainDTO] {
        if let error = mockError {
            throw error
        }
        return mockRecentMatchDomainDTO
    }
}
