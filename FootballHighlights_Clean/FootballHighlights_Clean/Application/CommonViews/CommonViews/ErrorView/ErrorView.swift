//
//  ErrorView.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 08/02/24.
//

import SwiftUI
import PreviewSnapshots

struct ErrorView: View {

    let errorMessage: String?
    let retryAction: () -> Void

    @State private var isProgressView = false

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.orange)
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.headline)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            if isProgressView {
                ProgressView()
                    .padding(20)
            } else {
                Button {
                    withAnimation {
                        isProgressView.toggle()
                    }
                    retryAction()
                } label: {
                    Text("Retry")
                        .font(.headline)
                        .padding(20)
                }
                .contentShape(Rectangle())
            }
        }
        .padding(60)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.orange, lineWidth: 2)
        )
        .animation(.easeInOut, value: 0.5)
    }
}

// MARK: - Previews
#if DEBUG
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
        nilErrorSnapshots.previews.previewLayout(.sizeThatFits)
    }
}
#endif
