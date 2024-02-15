//
//  MockFetchRecentMatchListUseCase.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation
@testable import FootballHighlights_Clean

final class MockFetchRecentMatchListUseCase: FetchRecentMatchListUseCase {
    var mockRecentMatchList: [RecentMatch] = []
    var mockError: Error?
    
    func execute() async throws -> [RecentMatch] {
        if let error = mockError {
            throw error
        }
        return mockRecentMatchList
    }
}
