//
//  AppDIContainer.swift
//  FootballHighlights-SUI
//
//  Created by Writayan Das on 06/02/24.
//

import NetworkManager

final class AppDIContainer {

    var networkService: NetworkService {
        DataNetworkService()
    }

    lazy var recentHighlightsListDashboardView: HighlightsListDashboardView = {
        let recentMatchListFactory = RecentMatchListFactory(networkService: networkService)
        return recentMatchListFactory.makeHighlightsListDashboardView()
    }()
}
