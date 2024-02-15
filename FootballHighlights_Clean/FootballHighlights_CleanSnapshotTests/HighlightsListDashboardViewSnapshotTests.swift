//
//  HighlightsListDashboardViewSnapshotTests.swift
//  FootballHighlights_CleanSnapshotTests
//
//  Created by Writayan Das on 08/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import FootballHighlights_Clean

final class HighlightsListDashboardViewSnapshotTests: XCTestCase {

    func testSnapshots() {
        HighlightsListDashboardView_Previews.snapshots.assertSnapshots(as: .wait(for: 10, on: .image(layout: .device(config: .iPhone13Pro))))
    }
    
    func testSnapshotsWithError() {
        HighlightsListDashboardView_Previews.errorSnapshots.assertSnapshots(as: .wait(for: 10, on: .image(layout: .device(config: .iPhone13Pro))))
    }
}
