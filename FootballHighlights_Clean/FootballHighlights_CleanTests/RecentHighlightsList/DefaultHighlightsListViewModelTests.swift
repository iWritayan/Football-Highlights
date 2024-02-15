//
//  DefaultHighlightsListViewModelTests.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import XCTest
import NetworkManager
@testable import FootballHighlights_Clean

final class DefaultHighlightsListViewModelTests: XCTestCase {
    
    var mockUseCase: MockFetchRecentMatchListUseCase!
    var viewModel : DefaultHighlightsListViewModel!
    
    override func setUp() async throws {
        try await super.setUp()
        mockUseCase = MockFetchRecentMatchListUseCase()
        mockUseCase.mockRecentMatchList = MockMatchData.recentMatchList
        viewModel = DefaultHighlightsListViewModel(fetchRecentMatchListUseCase: mockUseCase)
        XCTAssertTrue(viewModel.shouldLoadData())
        await viewModel.fetchRecentMatches()
    }
    
    override func tearDown() {
        super.tearDown()
        mockUseCase = nil
        viewModel = nil
    }

    func testShouldLoadData() {
        XCTAssertFalse(viewModel.shouldLoadData())
    }
    
    func testShouldShowError() {
        XCTAssertFalse(viewModel.shouldShowError())
    }
    
    func testGetMatchList() {
        XCTAssertFalse(viewModel.getMatchList().isEmpty)
    }
    
    func testGetError() {
        XCTAssertNil(viewModel.getError())
    }
}
