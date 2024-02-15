//
//  RecentMatchListService.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation
import NetworkManager

protocol RecentMatchListNetworkService {
    func fetch() async throws -> [RecentMatchDataDTO]
}

final class DefaultRecentMatchListNetworkService: RecentMatchListNetworkService {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetch() async throws -> [RecentMatchDataDTO] {
        do {
            let recentMatchList = try await networkService.fetchDataFor(request: RecentMatchListRequest())
            return recentMatchList.response.map {
                RecentMatchDataDTO(title: $0.title, competition: $0.competition,
                                   thumbnail: $0.thumbnail,
                                   date: $0.date,
                                   videoEmbed: $0.videos.first?.embed ?? "")
            }
        } catch {
            throw error
        }
    }
}
