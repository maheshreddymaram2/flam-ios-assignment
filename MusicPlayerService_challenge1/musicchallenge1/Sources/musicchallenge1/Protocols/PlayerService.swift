import Foundation

public protocol PlayerService {
    /// Currently playing item (nill if stops)
    var currentItem: PlayerItem? { get }

    /// Playback state
    var playbackState: PlaybackState { get }

    /// Progress in seconds
    var progress: TimeInterval { get }

    /// Play a specific item
    func play(_ item: PlayerItem)

    /// Pause playback
    func pause()

    /// Play next item in the queue
    func next()

    /// Play previous item in the queue
    func previous()

    /// Enqueue an item to the end of the queue
    func enqueue(_ item: PlayerItem)
}
