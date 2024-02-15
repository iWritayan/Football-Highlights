//
//  HighlightsListViewSnapshotTests.swift
//  FootballHighlights_CleanSnapshotTests
//
//  Created by Writayan Das on 07/02/24.
//

import PreviewSnapshotsTesting
import XCTest
@testable import FootballHighlights_Clean


final class HighlightsListViewSnapshotTests: XCTestCase {

    func testSnapshots() {
        HighlightsListView_Previews.snapshots.assertSnapshots(as: .wait(for: 2, on: .image(layout: .device(config: .iPhone13Pro))))
    }
}
