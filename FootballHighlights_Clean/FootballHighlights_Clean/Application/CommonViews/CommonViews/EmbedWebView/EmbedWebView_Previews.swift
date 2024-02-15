//
//  EmbedWebView_Previews.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 15/02/24.
//

#if DEBUG
import SwiftUI
import PreviewSnapshots

extension EmbedWebView_Previews {
    
    static var snapshots: PreviewSnapshots<String> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Preview Image",
                      state: "<embed type=\"image/jpg\" src=\"https://picsum.photos/id/20/500/1000\">")
            ],
            configure: { state in
                EmbedWebView(embedString: state, navigationDelegate: nil).padding()
            }
        )
    }
}
#endif
