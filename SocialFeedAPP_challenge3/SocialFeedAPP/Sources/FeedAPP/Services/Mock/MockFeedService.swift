import Foundation

class MockFeedService: FeedServiceProtocol {
    func fetchFeed(completion: @escaping (Result<[Post], Error>) -> Void) {
        let posts = [
            Post(id: 1, type: .text, content: "Hello, world!", author: "Mahesh"),
            Post(id: 2, type: .image, content: "Look at this image", author: "Sita")
        ]
        completion(.success(posts))
    }
}

