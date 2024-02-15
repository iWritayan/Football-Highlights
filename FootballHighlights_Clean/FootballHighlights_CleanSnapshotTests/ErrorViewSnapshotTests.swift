//
//  ErrorViewSnapshotTests.swift
//  FootballHighlights_CleanSnapshotTests
//
//  Created by Writayan Das on 08/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import FootballHighlights_Clean

final class ErrorViewSnapshotTests: XCTestCase {

    func testSnapshots() {
        ErrorView_Previews.snapshots.assertSnapshots(as: .image(layout: .device(config: .iPhone13Pro)))
    }
    
    func testNilSnapshots() {
        ErrorView_Previews.nilErrorSnapshots.assertSnapshots(as: .image(layout: .device(config: .iPhone13Pro)))
    }
}
