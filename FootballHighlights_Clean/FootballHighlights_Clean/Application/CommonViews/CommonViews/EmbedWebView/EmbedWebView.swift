//
//  EmbedWebView.swift
//  FootballHighlights-SUI
//
//  Created by Writayan Das on 28/01/24.
//

import SwiftUI
import WebKit
import PreviewSnapshots

struct EmbedWebView: UIViewRepresentable {

    let embedString: String
    let navigationDelegate: WKNavigationDelegate?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString("<!DOCTYPE html><html><body>\(embedString)</body></html>", baseURL: nil)
    }
}

// MARK: - Previews
#if DEBUG
struct EmbedWebView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
}
#endif
