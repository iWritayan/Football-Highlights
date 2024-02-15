//
//  MockMatchData.swift
//  FootballHighlights_CleanTests
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation
@testable import FootballHighlights_Clean

final class MockMatchData {
    
    static var recentMatchDataDTO: [RecentMatchDataDTO] {
        footballHighlightsDataModel.response.map {
            RecentMatchDataDTO(title: $0.title, competition: $0.competition,
                               thumbnail: $0.thumbnail,
                               date: $0.date,
                               videoEmbed: $0.videos.first?.embed ?? "")
        }
    }
    
    static var recentMatchDomainDTO: [RecentMatchDomainDTO] {
        return recentMatchDataDTO.map { $0.domainDTO() }
    }
    
    static var recentMatchList: [RecentMatch] {
        return recentMatchDomainDTO.map { $0.recentMatch() }
    }
    
    static var footballHighlightsDataModel: FootballHighlightsDataModel {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try! decoder.decode(FootballHighlightsDataModel.self, from: recentMatchData)
    }
    
    static var recentMatchData: Data {
        loadJsonData("MockRecentHighlightsResponse")
    }
    
    static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
    }
}
