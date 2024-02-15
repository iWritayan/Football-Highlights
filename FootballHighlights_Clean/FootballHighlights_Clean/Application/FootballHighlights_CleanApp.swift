//
//  FootballHighlights_CleanApp.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 06/02/24.
//

import SwiftUI
import Kingfisher

@main
struct FootballHighlights_CleanApp: App {
    
    let authenticationChallengeResponder = DefaultAuthenticationChallengeResponsible()
    
    var body: some Scene {
        WindowGroup {
            ContentView(appDIContainer: AppDIContainer()).task {
                ImageDownloader.default.authenticationChallengeResponder = authenticationChallengeResponder
            }
        }
    }
}
