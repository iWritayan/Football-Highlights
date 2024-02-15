//
//  RecentMatchListFactory.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import NetworkManager

final class RecentMatchListFactory {

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    private func makeRecentMatchListNetowrkService() -> RecentMatchListNetworkService {
        DefaultRecentMatchListNetworkService(networkService: networkService)
    }

    private func makeRecentMatchListRespository() -> RecentMatchListRespository {
        DefaultRecentMatchListRespository(networkService: makeRecentMatchListNetowrkService())
    }

    private func makeFetchRecentMatchListUseCase() -> FetchRecentMatchListUseCase {
        DefaultFetchRecentMatchListUseCase(respository: makeRecentMatchListRespository())
    }

    private func makeHighlightsListViewModel() -> HighlightsListViewModel {
        DefaultHighlightsListViewModel(fetchRecentMatchListUseCase: makeFetchRecentMatchListUseCase())
    }

    func makeHighlightsListDashboardView() -> HighlightsListDashboardView {
        HighlightsListDashboardView(viewModel: makeHighlightsListViewModel())
    }
}
