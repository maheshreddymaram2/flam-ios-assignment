import Foundation
import musicchallenge1
import Dispatch


@main
struct MusicChallengeCLI {
    static func main() async {
        let source = SpotifyMockAudioSource()
        let player = MockPlayerService()

        do {
            let items = try await source.fetchItems()
            print("🎵 Spotify Songs:")
            for (index, item) in items.enumerated() {
                print("\(index + 1). \(item.title) - \(item.artist) [\(Int(item.duration)) sec]")
            }

            if let first = items.first {
                player.play(first)
                try await Task.sleep(nanoseconds: 1_000_000_000)

                player.pause()
                player.enqueue(items[1])
                player.next()
            }

        } catch {
            print("❌ Failed to load songs: \(error)")
        }
    }
}

