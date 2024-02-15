//
//  CommonViewsFactory.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 13/02/24.
//

import Foundation

final class CommonViewsFactory {
    
    func makeThumbnailImageView(urlString: String, placeholderImageName: String) -> HighlightThumbnailImageView {
        HighlightThumbnailImageView(urlString: urlString, placeholderImageName: placeholderImageName)
    }

    func makeEmbedWebView(embedString: String) -> EmbedWebView {
        EmbedWebView(embedString: embedString, navigationDelegate: DefaultWKNavigationDelegate())
    }
    
    func makeErrorView(errorMessage: String?, retryAction: @escaping () -> Void) -> ErrorView {
        ErrorView(errorMessage: errorMessage, retryAction: retryAction)
    }
}
