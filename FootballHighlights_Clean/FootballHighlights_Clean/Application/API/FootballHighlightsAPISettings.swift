struct FootballHighlightsAPISettings {

    let environment: Environment

    static var development: Self {
        FootballHighlightsAPISettings(environment: FootballHighlightsEnvironment())
    }
}
