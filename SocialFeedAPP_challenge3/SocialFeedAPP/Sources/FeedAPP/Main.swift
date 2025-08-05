import Foundation

@main
struct FeedApp {
    static func main() {
        let viewModel = FeedViewModel(service: MockFeedService())
        FeedView(viewModel: viewModel).run()
    }
}
