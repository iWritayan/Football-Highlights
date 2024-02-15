//
//  RecentMatchDataDTO.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation

struct RecentMatchDataDTO: Decodable {
    let title, competition: String
    let thumbnail: String
    let date: Date
    let videoEmbed: String
}

extension RecentMatchDataDTO {
    func domainDTO() -> RecentMatchDomainDTO {
        RecentMatchDomainDTO(title: title, competition: competition,
                             thumbnail: thumbnail,
                             date: date,
                             videoEmbed: videoEmbed)
    }
}
