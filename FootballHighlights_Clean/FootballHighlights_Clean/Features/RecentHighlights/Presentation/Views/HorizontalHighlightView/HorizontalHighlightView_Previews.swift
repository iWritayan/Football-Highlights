//
//  HorizontalHighlightView_Previews.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 15/02/24.
//

#if DEBUG
import SwiftUI
import PreviewSnapshots

extension HorizontalHighlightView_Previews {
    
    static var snapshots: PreviewSnapshots<RecentMatch> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Sample Match",
                      state: RecentMatch(title: "Liverpool - Newcastle United",
                                         competition: "ENGLAND: Premier League",
                                         thumbnail: "https://www.scorebat.com/og/m/og1359366.jpeg",
                                         date: ISO8601DateFormatter().date(from: "2024-01-01T20:00:00+0000")!,
                                         videoEmbed: "")
                     ),
                .init(name: "All Empty",
                      state: RecentMatch(title: "",
                                         competition: "",
                                         thumbnail: "",
                                         date: ISO8601DateFormatter().date(from: "1700-01-01T00:00:00+0000")!,
                                         videoEmbed: "")
                     )
            ],
            configure: { state in
                HorizontalHighlightView(viewModel: DefaultRecentMatchListItemViewModel(matchdata: state)).padding()
            }
        )
    }
}
#endif
