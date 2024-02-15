//
//  HighlightThumbnailImageViewSnapshotTests.swift
//  FootballHighlights_CleanSnapshotTests
//
//  Created by Writayan Das on 13/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import FootballHighlights_Clean

final class HighlightThumbnailImageViewSnapshotTests: XCTestCase {

    func testSnapshots() {
        HighlightThumbnailImageView_Previews.snapshots.assertSnapshots(as: .wait(for: 10, on: .image(layout: .device(config: .iPhone13Pro))))
    }
    
    func testErrorSnapshots() {
        HighlightThumbnailImageView_Previews.errorSnapshots.assertSnapshots(as: .wait(for: 10, on: .image(layout: .device(config: .iPhone13Pro))))
    }
}
