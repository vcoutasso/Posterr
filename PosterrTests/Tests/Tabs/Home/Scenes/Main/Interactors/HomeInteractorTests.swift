import XCTest
@testable import Posterr

final class HomeInteractorTests: XCTestCase {
    // MARK: - Dependencies

    private let presenterSpy = HomePresenterSpy()

    // MARK: - System under test

    private lazy var sut = HomeInteractor(presenter: presenterSpy)

    // MARK: - Tests

    func testNewPostShouldPresentNewPostView() {
        // Given
        let request = Home.NewPost.Request()

        // When
        sut.newPost(request)

        // Then
        XCTAssert(presenterSpy.didPresentNewPostView)
    }

    func testAddPostShouldAddToAllPosts() {
        // Given
        let newPost = Fixtures.Posts.new
        XCTAssert(sut.allPosts.isEmpty)

        // When
        sut.addPost(newPost)

        // Then
        XCTAssert(sut.allPosts.contains(newPost))
    }
}
