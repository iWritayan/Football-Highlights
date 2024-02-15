//
//  HighlightsListViewModel.swift
//  Football Highlights
//
//  Created by Writayan Das on 11/01/24.
//

import Foundation

protocol HighlightsListViewModelInput {
    func fetchRecentMatches() async
}

protocol HighlightsListViewModelOutput {
    func shouldLoadData() -> Bool
    func shouldShowError() -> Bool
    func getMatchList() -> [RecentMatch]
    func getError() -> Error?
}

typealias HighlightsListViewModel = HighlightsListViewModelInput & HighlightsListViewModelOutput

final class DefaultHighlightsListViewModel: HighlightsListViewModel {
    
    private var recentMatchListResult: Swift.Result<[RecentMatch], Error> = .success([])
    private var fetchRecentMatchListUseCase: FetchRecentMatchListUseCase

    init(fetchRecentMatchListUseCase: FetchRecentMatchListUseCase) {
        self.fetchRecentMatchListUseCase = fetchRecentMatchListUseCase
    }

    /// fetch recent match list
    @MainActor
    func fetchRecentMatches() async {
        do {
            recentMatchListResult = .success(try await fetchRecentMatchListUseCase.execute())
        } catch {
            recentMatchListResult = .failure(error)
        }
    }
    
    /// method to determine whether data should be fetched
    /// - Returns: true if data shoud be loaded
    func shouldLoadData() -> Bool {
        switch recentMatchListResult {
        case .success(let matchList):
            return matchList.isEmpty
        case .failure:
            return false
        }
    }
    
    /// method to determine if error should be shown
    /// - Returns: true if error should be shown
    func shouldShowError() -> Bool {
        return getError() != nil
    }
    
    /// method to get fetched data
    /// - Returns: list of recent matches
    func getMatchList() -> [RecentMatch] {
        switch recentMatchListResult {
        case .success(let matchList):
            return matchList
        case .failure:
            return []
        }
    }
    
    /// method to get error
    /// - Returns: error
    func getError() -> Error? {
        switch recentMatchListResult {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
