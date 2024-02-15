//
//  MatchListItemFactory.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 14/02/24.
//

import Foundation

class MatchListItemFactory {
    
    private func makeRecentMatchListItemViewModel(matchData: RecentMatch) -> RecentMatchListItemViewModel {
        DefaultRecentMatchListItemViewModel(matchdata: matchData)
    }
    
    func makeHorizontalHighlightView(matchData: RecentMatch) -> HorizontalHighlightView {
        HorizontalHighlightView(viewModel: makeRecentMatchListItemViewModel(matchData: matchData))
    }
    
    func makeVerticalHighlightView(matchData: RecentMatch) -> VerticalHighlightView {
        VerticalHighlightView(viewModel: makeRecentMatchListItemViewModel(matchData: matchData))
    }
}
