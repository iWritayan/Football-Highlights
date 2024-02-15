//
//  DefaultFetchRecentMatchListUseCaseTests.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import XCTest
import NetworkManager
@testable import FootballHighlights_Clean

final class DefaultFetchRecentMatchListUseCaseTests: XCTestCase {
    var mockRepository: MockRecentMatchListRespository!
    var useCase: DefaultFetchRecentMatchListUseCase!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockRecentMatchListRespository()
        useCase = DefaultFetchRecentMatchListUseCase(respository: mockRepository)
    }
    
    override func tearDown() {
        super.tearDown()
        mockRepository = nil
        useCase = nil
    }
    
    func testFetchWithSuccess() async throws {
        mockRepository.mockRecentMatchDomainDTO = MockMatchData.recentMatchDomainDTO
        let result = try await useCase.execute()
        XCTAssertTrue(result.count > 0, "Expected some recent matches")
    }
    
    func testFetchNoData() async throws {
        mockRepository.mockRecentMatchDomainDTO = []
        let result = try await useCase.execute()
        XCTAssertTrue(result.isEmpty)
    }

    func testFetchFailure() async throws {
        mockRepository.mockError = ErrorResponse.invalidData
        do {
            _ = try await useCase.execute()
            XCTFail("Success not expected")
        } catch {
            XCTAssertEqual(error.localizedDescription, ErrorResponse.invalidData.localizedDescription)
        }
    }
}
