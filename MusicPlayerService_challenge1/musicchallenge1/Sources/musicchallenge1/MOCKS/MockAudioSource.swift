import Foundation

public final class MockAudioSource: AudioSource {
    private let items: [PlayerItem]

    public init() {
        self.items = [
            PlayerItem(title: "Moonlight Sonata", artist: "Beethoven", duration: 340),
            PlayerItem(title: "Nocturne in E-flat", artist: "Chopin", duration: 270),
            PlayerItem(title: "Four Seasons", artist: "Vivaldi", duration: 390)
        ]
    }

    public func fetchItems() async throws -> [PlayerItem] {
        // Simulates network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return items
    }

    public func url(for item: PlayerItem) -> URL {
        // writes dummy URLs for (local files or remote stubs)
        return URL(string: "https://example.com/audio/\(item.id).mp3")!
    }
}
