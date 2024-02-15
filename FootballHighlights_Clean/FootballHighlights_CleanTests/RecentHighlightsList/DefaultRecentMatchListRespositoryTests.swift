//
//  DefaultRecentMatchListRespositoryTests.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import XCTest
import NetworkManager
@testable import FootballHighlights_Clean

final class DefaultRecentMatchListRespositoryTests: XCTestCase {
    var mockRecentMatchListNetworkService: MockRecentMatchListNetworkService!
    var mockRepository: DefaultRecentMatchListRespository!
    
    override func setUp() {
        super.setUp()
        mockRecentMatchListNetworkService = MockRecentMatchListNetworkService()
        mockRepository = DefaultRecentMatchListRespository(networkService: mockRecentMatchListNetworkService)
    }
    
    override func tearDown() {
        super.tearDown()
        mockRecentMatchListNetworkService = nil
        mockRepository = nil
    }
    
    func testFetchData() async throws {
        mockRecentMatchListNetworkService.mockRecentMatchDataDTO = MockMatchData.recentMatchDataDTO
        let result = try await mockRepository.fetch()
        XCTAssertTrue(result.count > 0)
    }

    func testFetchDataWithError() async throws {
        mockRecentMatchListNetworkService.mockError =  ErrorResponse.invalidData
        do {
            let _ = try await mockRepository.fetch()
            XCTFail("Success not expected")
        }
        catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}
