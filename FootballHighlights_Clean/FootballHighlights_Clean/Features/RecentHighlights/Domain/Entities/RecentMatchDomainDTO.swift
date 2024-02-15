//
//  RecentMatchDomainDTO.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation

struct RecentMatchDomainDTO {

    let title, competition: String
    let thumbnail: String
    let date: Date
    let videoEmbed: String
}

extension RecentMatchDomainDTO {
    func recentMatch() -> RecentMatch {
        RecentMatch(title: title, competition: competition,
                    thumbnail: thumbnail,
                    date: date,
                    videoEmbed: videoEmbed)
    }
}
