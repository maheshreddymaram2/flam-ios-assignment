import Foundation

public final class MockPlayerService: PlayerService {
    private var items: [PlayerItem] = []
    private var index: Int? = nil
    private(set) public var playbackState: PlaybackState = .stopped
    private(set) public var progress: TimeInterval = 0

    public var currentItem: PlayerItem? {
        guard let index = index, index >= 0 && index < items.count else { return nil }
        return items[index]
    }

    public init() {}

    public func play(_ item: PlayerItem) {
        if let i = items.firstIndex(of: item) {
            index = i
        } else {
            items.insert(item, at: 0)
            index = 0
        }
        playbackState = .playing
        progress = 0
        print("▶️  Playing: \(item.title) by \(item.artist)")
    }

    public func pause() {
        guard playbackState == .playing else { return }
        playbackState = .paused
        print("⏸️  Paused: \(currentItem?.title ?? "Nothing")")
    }

    public func next() {
        guard let index = index, index + 1 < items.count else {
            print("⛔  No next track.")
            return
        }
        self.index = index + 1
        progress = 0
        playbackState = .playing
        print("⏭️  Skipped to next: \(currentItem?.title ?? "Unknown")")
    }

    public func previous() {
        guard let index = index, index - 1 >= 0 else {
            print("⛔  No previous track.")
            return
        }
        self.index = index - 1
        progress = 0
        playbackState = .playing
        print("⏮️  Returned to: \(currentItem?.title ?? "Unknown")")
    }

    public func enqueue(_ item: PlayerItem) {
        items.append(item)
        print("➕ Enqueued: \(item.title)")
    }
}
