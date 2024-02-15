import Foundation

extension FootballHighlightsAPISettings {
    var recentHighlights: String { getURLString(path: "/feed/") }
}

// MARK: - Helpers
fileprivate extension FootballHighlightsAPISettings {
    func getURLString(path: String) -> String {
        "\(environment.baseURL)\(environment.version)\(path)"
    }
}
