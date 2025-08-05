import XCTest
@testable import musicchallenge1

final class MockAudioSourceTests: XCTestCase {
    func testFetchItemsReturnsCorrectCount() async throws {
        let source = MockAudioSource()
        let items = try await source.fetchItems()
        XCTAssertEqual(items.count, 3)
    }
}
