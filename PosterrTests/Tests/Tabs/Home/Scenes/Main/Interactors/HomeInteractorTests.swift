import XCTest
@testable import Posterr

final class HomeInteractorTests: XCTestCase {
    // MARK: - Dependencies

    private let presenterSpy = HomePresenterSpy()
    private let postDataStore = AppPostDataStore()

    // MARK: - System under test

    private lazy var sut = HomeInteractor(presenter: presenterSpy, postDataStore: postDataStore)

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
        XCTAssert(sut.postDataStore.allPosts.isEmpty)

        // When
        sut.postDataStore.addNewPost(newPost)

        // Then
        XCTAssert(sut.postDataStore.allPosts.contains(newPost))
    }
}
