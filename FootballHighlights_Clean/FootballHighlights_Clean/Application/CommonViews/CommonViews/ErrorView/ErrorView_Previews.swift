//
//  ErrorView_Previews.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 15/02/24.
//

#if DEBUG
import SwiftUI
import PreviewSnapshots

extension ErrorView_Previews {
    
    static var snapshots: PreviewSnapshots<String> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Sample Error", state: "Sample Error"),
                .init(name: "Multiline Error", state: "Sample Error 1\nSample Error 2"),
            ],
            configure: { state in
                ErrorView(errorMessage: state, retryAction: {}).padding()
            }
        )
    }
    
    static var nilErrorSnapshots: PreviewSnapshots<String> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Nil Error", state: "")
            ],
            configure: { state in
                ErrorView(errorMessage: nil, retryAction: {}).padding()
            }
        )
    }
}
#endif
