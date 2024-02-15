//
//  HighlightsListDashboardView_Previews.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 15/02/24.
//

#if DEBUG
import SwiftUI
import PreviewSnapshots

extension HighlightsListDashboardView_Previews {

    static var snapshots: PreviewSnapshots<PreviewViewModel> {

        let viewModel = PreviewViewModel()
        viewModel.setData()

        return PreviewSnapshots(
            configurations: [
                .init(name: "Sample Match List",
                      state: viewModel)
            ],
            configure: { state in
                HighlightsListDashboardView(viewModel: state)
            }
        )
    }
    static var errorSnapshots: PreviewSnapshots<PreviewViewModel> {

        let viewModel = PreviewViewModel()
        viewModel.setError()

        return PreviewSnapshots(
            configurations: [
                .init(name: "Error",
                      state: viewModel)
            ],
            configure: { state in
                HighlightsListDashboardView(viewModel: state)
            }
        )
    }
}
#endif
