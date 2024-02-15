//
//  EmbedWebViewSnapshotTests.swift
//  FootballHighlights_CleanSnapshotTests
//
//  Created by Writayan Das on 08/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import FootballHighlights_Clean

final class EmbedWebViewSnapshotTests: XCTestCase {

    func testSnapshots() {
        EmbedWebView_Previews.snapshots.assertSnapshots(as: .wait(for: 10, on: .image(layout: .device(config: .iPhone13Pro))))
    }
}
