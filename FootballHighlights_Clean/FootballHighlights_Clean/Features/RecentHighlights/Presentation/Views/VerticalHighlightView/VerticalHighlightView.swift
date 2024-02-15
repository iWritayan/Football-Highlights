//
//  VerticalHighlightView.swift
//  FootballHighlights-SUI
//
//  Created by Writayan Das on 27/01/24.
//

import SwiftUI
import Kingfisher

struct VerticalHighlightView: View {

    let viewModel: RecentMatchListItemViewModel
    
    init(viewModel: RecentMatchListItemViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            NavigationLink(destination: CommonViewsFactory().makeEmbedWebView(embedString: viewModel.getVideoEmbedString())) {
            }
            .frame(width: 0)
            .opacity(0)

            VStack(spacing: 20) {
                CommonViewsFactory()
                    .makeThumbnailImageView(urlString: viewModel.getThumbnailURLString(),
                                            placeholderImageName: RecentHighlightsConstants.ResourceNames.placeholderImage)
                    .accessibilityIdentifier(RecentHighlightsConstants.AccessibilityIdentifiers.thumbnailImage)

                VStack(spacing: 10) {
                    Text(viewModel.getTitle())
                        .font(.system(size: 22.0, weight: .bold))
                        .accessibilityIdentifier(RecentHighlightsConstants.AccessibilityIdentifiers.matchLabel)
                    Text(viewModel.getCompetition())
                        .font(.system(size: 15.0))
                        .accessibilityIdentifier(RecentHighlightsConstants.AccessibilityIdentifiers.competitionLabel)
                    Text(viewModel.getDate().string(dateStyle: .medium))
                        .font(.system(size: 15.0, weight: .semibold))
                        .accessibilityIdentifier(RecentHighlightsConstants.AccessibilityIdentifiers.dateLabel)
                }
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            }
        }
        .alignmentGuide(.listRowSeparatorLeading) { dimension in
            dimension[.leading]
        }
        .alignmentGuide(.listRowSeparatorTrailing) { dimension in
            dimension[.trailing]
        }
    }
}

// MARK: - Previews
#if DEBUG
struct VerticalHighlightView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
}
#endif
