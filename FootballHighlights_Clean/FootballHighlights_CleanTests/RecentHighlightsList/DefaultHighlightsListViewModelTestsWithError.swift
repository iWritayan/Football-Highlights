//
//  DefaultHighlightsListViewModelTestsWithError.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 13/02/24.
//

import XCTest
import NetworkManager
@testable import FootballHighlights_Clean

final class DefaultHighlightsListViewModelTestsWithError: XCTestCase {
    
    var mockUseCase: MockFetchRecentMatchListUseCase!
    var viewModel : DefaultHighlightsListViewModel!
    
    override func setUp() async throws {
        try await super.setUp()
        mockUseCase = MockFetchRecentMatchListUseCase()
        mockUseCase.mockError = ErrorResponse.invalidData
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
        XCTAssertTrue(viewModel.shouldShowError())
    }
    
    func testGetMatchList() {
        XCTAssertTrue(viewModel.getMatchList().isEmpty)
    }
    
    func testGetError() {
        XCTAssertEqual(viewModel.getError()?.localizedDescription, ErrorResponse.invalidData.localizedDescription)
    }
}
