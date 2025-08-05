import Foundation

protocol FeedServiceProtocol {
    func fetchFeed(completion: @escaping (Result<[Post], Error>) -> Void)
}
