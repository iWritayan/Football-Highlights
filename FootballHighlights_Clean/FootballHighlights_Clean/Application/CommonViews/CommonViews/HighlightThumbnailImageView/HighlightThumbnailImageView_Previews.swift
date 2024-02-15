//
//  HighlightThumbnailImageView_Previews.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 15/02/24.
//

#if DEBUG
import SwiftUI
import PreviewSnapshots

extension HighlightThumbnailImageView_Previews {

    static var snapshots: PreviewSnapshots<String> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Sample Image", state: "https://www.scorebat.com/og/m/og1359366.jpeg")
            ],
            configure: { state in
                HighlightThumbnailImageView(urlString: state, placeholderImageName: "DummyImage").padding()
            }
        )
    }
    
    static var errorSnapshots: PreviewSnapshots<String> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Error", state: "")
            ],
            configure: { state in
                HighlightThumbnailImageView(urlString: state, placeholderImageName: "DummyImage").padding()
            }
        )
    }
}
#endif
