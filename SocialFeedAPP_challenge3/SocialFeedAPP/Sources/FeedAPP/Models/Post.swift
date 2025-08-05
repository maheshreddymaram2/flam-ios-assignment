import Foundation

enum PostType: String {
    case text, image, video
}

struct Post {
    let id: Int
    let type: PostType
    let content: String
    let author: String
}
