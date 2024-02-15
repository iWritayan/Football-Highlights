//
//  PreviewViewModel.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 13/02/24.
//

#if DEBUG
import Foundation
import NetworkManager

/// this view model is used for SwiftUI previews
class PreviewViewModel: HighlightsListViewModel {
    
    private var recentMatchListResult: Swift.Result<[RecentMatch], Error> = .success([])
    private var shouldForceError: Bool = true

    func fetchRecentMatches() async {
        if shouldForceError {
            setError()
        } else {
            setData()
        }
        shouldForceError.toggle()
    }
    
    func shouldLoadData() -> Bool {
        return true
    }
    
    func shouldShowError() -> Bool {
        return getError() != nil
    }
    
    func getMatchList() -> [RecentMatch] {
        switch recentMatchListResult {
        case .success(let matchList):
            return matchList
        case .failure:
            return []
        }
    }
    
    func getError() -> Error? {
        switch recentMatchListResult {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }

    func setData() {
        recentMatchListResult = .success(
            Array(repeating: RecentMatch(title: "Liverpool - Newcastle United",
                                         competition: "ENGLAND: Premier League",
                                         thumbnail: "https://www.scorebat.com/og/m/og1359366.jpeg",
                                         date: ISO8601DateFormatter().date(from: "2024-01-01T20:00:00+0000")!,
                                         videoEmbed: ""),
                  count: 5)
        )
        shouldForceError = false
    }

    func setError() {
        recentMatchListResult = .failure(ErrorResponse.invalidData)
        shouldForceError = true
    }
}
#endif
