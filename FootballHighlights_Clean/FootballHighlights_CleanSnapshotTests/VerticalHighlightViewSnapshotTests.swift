//
//  VerticalHighlightView.swift
//  FootballHighlights_CleanSnapshotTests
//
//  Created by Writayan Das on 07/02/24.
//

import PreviewSnapshotsTesting
import XCTest
@testable import FootballHighlights_Clean

final class VerticalHighlightViewSnapshotTests: XCTestCase {

    func testSnapshots() {
        VerticalHighlightView_Previews.snapshots.assertSnapshots(as: .image(layout: .device(config: .iPhone13Pro)))
    }
}
