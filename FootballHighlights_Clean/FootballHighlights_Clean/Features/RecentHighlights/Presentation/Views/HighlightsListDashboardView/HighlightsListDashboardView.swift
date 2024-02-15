//
//  HighlightsListDashboardView.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 08/02/24.
//

import SwiftUI
import SwiftLoader

struct HighlightsListDashboardView: View {

    @ObservedObject private var viewModelWrapper: HighlightsListViewModelWrapper

    init(viewModel: HighlightsListViewModel) {
        self.viewModelWrapper = HighlightsListViewModelWrapper(viewModel: viewModel)
    }

    var body: some View {
        VStack {
            if viewModelWrapper.shouldShowError() {
                CommonViewsFactory().makeErrorView(errorMessage: viewModelWrapper.error?.localizedDescription) {
                    _ = Task {
                        await fetchData()
                    }
                }
            } else {
                HighlightsListView(matchList: viewModelWrapper.recentMatchList)
            }
        }
        .navigationTitle(RecentHighlightsConstants.Strings.navigationTitle)
        .task {
            await loadData()
        }
    }

    private func loadData() async {
        if viewModelWrapper.shouldLoadData() {
            await fetchData()
        }
    }

    private func fetchData() async {
        SwiftLoader.show(animated: true)
        await viewModelWrapper.fetchRecentMatches()
        SwiftLoader.hide()
    }
}

// MARK: - ViewModel Wrapepr
private extension HighlightsListDashboardView {
    final class HighlightsListViewModelWrapper: ObservableObject {
        private let viewModel: HighlightsListViewModel
        var recentMatchList: [RecentMatch] = []
        var error: Error?

        init(viewModel: HighlightsListViewModel) {
            self.viewModel = viewModel
        }
        
        @MainActor
        func fetchRecentMatches() async {
            await viewModel.fetchRecentMatches()
            recentMatchList = viewModel.getMatchList()
            error = viewModel.getError()
            objectWillChange.send()
        }
        
        func shouldLoadData() -> Bool {
            viewModel.shouldLoadData()
        }
        
        func shouldShowError() -> Bool {
            viewModel.shouldShowError()
        }
    }
}

// MARK: - Previews
#if DEBUG
struct HighlightsListDashboardView_Previews: PreviewProvider {

    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
        errorSnapshots.previews.previewLayout(.sizeThatFits)
    }
}
#endif
