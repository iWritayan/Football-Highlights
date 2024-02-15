//
//  RecentMatchListItemViewModel.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 14/02/24.
//

import Foundation

protocol RecentMatchListItemViewModel {
    func getThumbnailURLString() -> String
    func getTitle() -> String
    func getCompetition() -> String
    func getDate() -> Date
    func getVideoEmbedString() -> String
}

class DefaultRecentMatchListItemViewModel: RecentMatchListItemViewModel {
    
    private var matchdata: RecentMatch
    
    init(matchdata: RecentMatch) {
        self.matchdata = matchdata
    }
    
    /// method to thumbnail image url
    /// - Returns: thumbnail image url
    func getThumbnailURLString() -> String {
        return matchdata.thumbnail
    }
    
    /// method to match title
    /// - Returns: match title
    func getTitle() -> String {
        return matchdata.title
    }
    
    /// method to get competition name
    /// - Returns: get competition name
    func getCompetition() -> String {
        return matchdata.competition
    }
    
    /// method to get competition date
    /// - Returns: competition date
    func getDate() -> Date {
        return matchdata.date
    }
    
    /// method to get video embed HTML
    /// - Returns: video embed HTML
    func getVideoEmbedString() -> String {
        return matchdata.videoEmbed
    }
}
