import Foundation

public struct PlayerItem: Equatable, Identifiable, Sendable{
    public let id: UUID
    public let title: String
    public let artist: String
    public let duration: TimeInterval

    public init(id: UUID = .init(), title: String, artist: String, duration: TimeInterval) {
        self.id = id
        self.title = title
        self.artist = artist
        self.duration = duration
    }
}
