import XCTest
@testable import musicchallenge1

final class MockPlayerServiceTests: XCTestCase {
    func testPlayAndPause() {
        let service = MockPlayerService()
        let item = PlayerItem(title: "Test Song", artist: "Tester", duration: 123)
        service.play(item)
        XCTAssertEqual(service.currentItem?.title, "Test Song")
        XCTAssertEqual(service.playbackState, .playing)

        service.pause()
        XCTAssertEqual(service.playbackState, .paused)
    }

    func testEnqueueAndNext() {
        let service = MockPlayerService()
        let item1 = PlayerItem(title: "A", artist: "X", duration: 100)
        let item2 = PlayerItem(title: "B", artist: "Y", duration: 200)

        service.play(item1)
        service.enqueue(item2)
        service.next()
        XCTAssertEqual(service.currentItem?.title, "B")
    }
}
