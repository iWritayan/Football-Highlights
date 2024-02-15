//
//  HighlightsListView.swift
//  FootballHighlights-SUI
//
//  Created by Writayan Das on 27/01/24.
//

import SwiftUI
import PreviewSnapshots

struct HighlightsListView: View {

    var matchList: [RecentMatch]

    var body: some View {
        GeometryReader { geometry in
            List {
                ForEach(Array(zip(matchList.indices, matchList)), id: \.0) { index, matchData in
                    if geometry.size.height < geometry.size.width {
                        MatchListItemFactory().makeHorizontalHighlightView(matchData: matchData)
                            .listRowBackground(Color.clear)
                            .accessibilityIdentifier(
                                "\(RecentHighlightsConstants.AccessibilityIdentifiers.horizontalListCell)\(index)"
                            )
                    } else {
                        MatchListItemFactory().makeVerticalHighlightView(matchData: matchData)
                            .listRowBackground(Color.clear)
                            .accessibilityIdentifier(
                                "\(RecentHighlightsConstants.AccessibilityIdentifiers.verticalListCell)\(index)"
                            )
                    }
                }
            }
            .listStyle(.plain)
            .accessibilityIdentifier(RecentHighlightsConstants.AccessibilityIdentifiers.matchList)
        }
    }
}

// MARK: - Previews
#if DEBUG
struct HighlightsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
}
#endif
