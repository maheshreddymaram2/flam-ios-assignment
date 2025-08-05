import Foundation

public final class SpotifyMockAudioSource: AudioSource {
    private let mockItems: [PlayerItem]

    public init() {
        self.mockItems = [
            PlayerItem(title: "Blinding Lights", artist: "The Weeknd", duration: 200),
            PlayerItem(title: "Shape of You", artist: "Ed Sheeran", duration: 230),
            PlayerItem(title: "Levitating", artist: "Dua Lipa", duration: 215)
        ]
    }

    public func fetchItems() async throws -> [PlayerItem] {
        try await Task.sleep(nanoseconds: 1_000_000_000) // simulate delay (1 sec)
        return mockItems
    }

    public func url(for item: PlayerItem) -> URL {
        return URL(string: "https://spotify.mock/\(item.title.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "track")")!
    }
}
