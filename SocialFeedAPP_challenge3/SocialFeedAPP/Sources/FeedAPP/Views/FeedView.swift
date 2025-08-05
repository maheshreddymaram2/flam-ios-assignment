import Foundation

struct FeedView {
    let viewModel: FeedViewModel

    func run() {
        print("📱 Welcome to SocialFeed App\n")

        let semaphore = DispatchSemaphore(value: 0)

        viewModel.onUpdate = {
            let posts = viewModel.posts
            for post in posts {
                print("🧑‍💻 Author: \(post.author)")
                print("📄 Content: \(post.content)")
                print("🔖 Type: \(post.type.rawValue)\n")
            }
            semaphore.signal()
        }

        viewModel.fetchFeed()
        semaphore.wait()
    }
}
