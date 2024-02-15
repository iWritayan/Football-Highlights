//
//  RecentMatchListRespository.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation

protocol RecentMatchListRespository {
    func fetch() async throws -> [RecentMatchDomainDTO]
}

final class DefaultRecentMatchListRespository: RecentMatchListRespository {

    private let networkService: RecentMatchListNetworkService

    init(networkService: RecentMatchListNetworkService) {
        self.networkService = networkService
    }

    func fetch() async throws -> [RecentMatchDomainDTO] {
        do {
            let matchDataList = try await networkService.fetch()
            return matchDataList.map { $0.domainDTO() }
        } catch {
            throw error
        }
    }
}
