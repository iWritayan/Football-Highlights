//
//  HighlightThumbnailImageView.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 13/02/24.
//

import SwiftUI
import Kingfisher
import PreviewSnapshots

struct HighlightThumbnailImageView: View {
    
    let urlString: String
    let placeholderImageName: String
    
    var body: some View {
        KFImage(URL(string: urlString))
            .placeholder {
                Image(placeholderImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(120.0/63.0, contentMode: .fit)
                    .cornerRadius(4.0)
            }
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .aspectRatio(120.0/63.0, contentMode: .fit)
            .cornerRadius(4.0)
    }
}

// MARK: - Previews
#if DEBUG
struct HighlightThumbnailImageView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
        errorSnapshots.previews.previewLayout(.sizeThatFits)
    }
}
#endif
