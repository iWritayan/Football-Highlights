//
//  FootballHighlightsDataModel.swift
//  Football Highlights
//
//  Created by Writayan Das on 11/01/24.
//

import Foundation

// MARK: - FootballHighlightsDataModel
struct FootballHighlightsDataModel: Decodable {
    let response: [RecentMatchHighlightDataModel]
}

// MARK: - RecentMatchHighlight
struct RecentMatchHighlightDataModel: Decodable {
    let title, competition: String
    let matchviewURL, competitionURL: String
    let thumbnail: String
    let date: Date
    let videos: [VideoDataModel]

    enum CodingKeys: String, CodingKey {
        case title, competition
        case matchviewURL = "matchviewUrl"
        case competitionURL = "competitionUrl"
        case thumbnail, date, videos
    }
}

// MARK: - Video
struct VideoDataModel: Identifiable, Decodable {
    let id, title, embed: String
}
