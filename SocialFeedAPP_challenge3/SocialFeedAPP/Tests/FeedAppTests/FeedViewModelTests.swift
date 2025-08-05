import Foundation
@testable import FeedApp

struct FeedViewModelTests {
    static func runAll() {
        testPostInitialization()
        testViewModelFetching()
        ConsoleColor.print("✅ All tests passed!", color: .green)
    }

    static func testPostInitialization() {
        let post = Post(id: 1, type: .text, content: "Hello Test", author: "Tester")
        assert(post.id == 1)
        assert(post.type == .text)
        assert(post.content == "Hello Test")
        assert(post.author == "Tester")
        ConsoleColor.print("✅ testPostInitialization passed.", color: .green)
    }

    static func testViewModelFetching() {
        let viewModel = FeedViewModel(service: MockFeedService())
        let semaphore = DispatchSemaphore(value: 0)

        viewModel.onUpdate = {
            assert(viewModel.posts.count == 2)
            assert(viewModel.posts[0].author == "Mahesh")
            semaphore.signal()
        }

        viewModel.fetchFeed()
        semaphore.wait()
        ConsoleColor.print("✅ testViewModelFetching passed.", color: .green)
    }
}
