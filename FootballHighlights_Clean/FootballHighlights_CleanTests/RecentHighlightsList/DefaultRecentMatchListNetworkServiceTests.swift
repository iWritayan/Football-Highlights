//
//  DefaultRecentMatchListNetworkServiceTests.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import XCTest
import NetworkManager
@testable import FootballHighlights_Clean

final class DefaultRecentMatchListNetworkServiceTests: XCTestCase {
    var mockNetworkService: MockNetworkService!
    var recentMatchListNetworkService: DefaultRecentMatchListNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        recentMatchListNetworkService = DefaultRecentMatchListNetworkService(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        super.tearDown()
        mockNetworkService = nil
        recentMatchListNetworkService = nil
    }
    
    func testFetchSuccess() async throws {
        mockNetworkService.mockData = MockMatchData.recentMatchData
        let mockFootballHighlightsDataModel = try await recentMatchListNetworkService.fetch()
        XCTAssertNotNil(mockFootballHighlightsDataModel)
    }
    
    func testFetchFailure() async throws {
        mockNetworkService.mockError = ErrorResponse.invalidData
        do {
            let _ = try await recentMatchListNetworkService.fetch()
            XCTFail("Success not expected")
        } catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}
