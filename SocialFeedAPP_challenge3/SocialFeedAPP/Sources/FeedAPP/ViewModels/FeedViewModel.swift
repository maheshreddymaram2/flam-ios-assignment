import Foundation

class FeedViewModel {
    private let service: FeedServiceProtocol
    private(set) var posts: [Post] = []
    var onUpdate: (() -> Void)?

    init(service: FeedServiceProtocol) {
        self.service = service
    }

    func fetchFeed() {
        service.fetchFeed { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.onUpdate?()
            case .failure(let error):
                print("❌ Error fetching feed: \(error)")
            }
        }
    }
}
