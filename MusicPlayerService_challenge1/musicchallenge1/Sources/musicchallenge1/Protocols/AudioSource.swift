import Foundation

public protocol AudioSource {
    /// checks the list of available items asynchronously
    func fetchItems() async throws -> [PlayerItem]

    /// writes the playback URL for a given item
    func url(for item: PlayerItem) -> URL
}
