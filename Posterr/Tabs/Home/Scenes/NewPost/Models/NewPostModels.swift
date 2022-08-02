import Foundation

enum NewPost {
    enum ContentChange {
        struct Request {
            let textLength: Int
        }

        struct Response {
            let isLengthValid: Bool
            let isEmpty: Bool
            let maxLength: Int
        }

        struct ViewModel {
            let isPlaceholderHidden: Bool
            let isTextTooLong: Bool
            let isPostValid: Bool
            let maxLength: Int
        }
    }

    enum Make {
        struct Request {
            let content: String
        }

        struct Response {
        }

        struct ViewModel {
        }
    }

    enum Cancel {
        struct Request {
        }

        struct Response {
        }

        struct ViewModel {
        }
    }
}
