//
//  RecentMatchListRequest.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation
import NetworkManager

struct RecentMatchListRequest: DataRequest {

    typealias ResponseData = FootballHighlightsDataModel
    var url: String = FootballHighlightsAPISettings.development.recentHighlights
    var method: HTTPMethod = .get
    var headers: [String: String] = [:]
    var queryItems: [String: String] = ["token": FootballHighlightsAPISettings.development.environment.apiToken]

    func decode(_ data: Data) throws -> FootballHighlightsDataModel {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(ResponseData.self, from: data)
    }
}
