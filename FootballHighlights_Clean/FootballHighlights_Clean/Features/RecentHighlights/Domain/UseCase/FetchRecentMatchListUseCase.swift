//
//  FetchRecentMatchListUseCase.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation

protocol FetchRecentMatchListUseCase {
    func execute() async throws -> [RecentMatch]
}

final class DefaultFetchRecentMatchListUseCase: FetchRecentMatchListUseCase {

    private let respository: RecentMatchListRespository

    init(respository: RecentMatchListRespository) {
        self.respository = respository
    }

    func execute() async throws -> [RecentMatch] {
        try await respository.fetch().map { $0.recentMatch() }
    }
}
