//
//  DefaultRecentMatchListItemViewModelTests.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 14/02/24.
//

import XCTest
import NetworkManager
@testable import FootballHighlights_Clean

final class DefaultRecentMatchListItemViewModelTests: XCTestCase {
    
    var viewModel: DefaultRecentMatchListItemViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = DefaultRecentMatchListItemViewModel(matchdata: MockMatchData.recentMatchList.first!)
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testGetThumbnailURLString() {
        XCTAssertEqual(viewModel.getThumbnailURLString(), "https://www.scorebat.com/og/m/og1467195.jpeg")
    }
    
    func testGetTitle() {
        XCTAssertEqual(viewModel.getTitle(), "Liverpool - Fulham")
    }
    
    func testGetCompetition() {
        XCTAssertEqual(viewModel.getCompetition(), "ENGLAND: League Cup")
    }
    
    func testGetDate() {
        XCTAssertEqual(viewModel.getDate(), ISO8601DateFormatter().date(from: "2024-01-10T20:00:00+0000"))
    }
    
    func testGetVideoEmbedString() {
        XCTAssertEqual(viewModel.getVideoEmbedString(), "<div style='width:100%;height:0px;position:relative;padding-bottom:56.250%;background:#000;'><iframe src='https://www.scorebat.com/embed/v/N0VFa1FCcmcwZm5JcGNiRXhjbTFrZz09/?token=MTM2OTgwXzE3MDQ5MzkwNjhfYzIwY2I3MjU3MGM0MTc0YWI5Y2FiNDBiZjBhODAwOTcyMTNhYmNkMg==&utm_source=api&utm_medium=video&utm_campaign=apifd' frameborder='0' width='100%' height='100%' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;'></iframe></div>")
    }
}
