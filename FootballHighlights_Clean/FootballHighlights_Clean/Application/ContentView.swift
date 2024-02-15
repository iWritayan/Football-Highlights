//
//  ContentView.swift
//  FootballHighlights-SUI
//
//  Created by Writayan Das on 27/01/24.
//

import SwiftUI

struct ContentView: View {

    let appDIContainer: AppDIContainer

    var body: some View {
        NavigationView {
            appDIContainer.recentHighlightsListDashboardView
        }
    }
}

#Preview {
    ContentView(appDIContainer: AppDIContainer())
}
