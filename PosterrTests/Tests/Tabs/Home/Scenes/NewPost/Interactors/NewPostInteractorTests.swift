import XCTest
@testable import Posterr

final class NewPostInteractorTests: XCTestCase {
    // MARK: - Dependencies

    private let presenterSpy = NewPostPresenterSpy()

    // MARK: - System under test

    private lazy var sut = NewPostInteractor(presenter: presenterSpy)

    // MARK: - Tests

    func testHandleContentChangeShouldPresentUpdatedInterface() {
        // Given
        let request = NewPost.ContentChange.Request(textLength: 1)

        // When
        sut.handleContentChange(request)

        // Then
        XCTAssert(presenterSpy.didPresentUpdatedInterface)
    }

    func testMakePostShouldPresentCompletedPost() {
        // Given
        let request = NewPost.Post.Request(content: "")

        // When
        sut.makePost(request)

        // Then
        XCTAssert(presenterSpy.didPresentCompletedPost)
    }

    func testCanelPostShouldPresentCancelledPost() {
        // Given
        let request = NewPost.Cancel.Request()

        // When
        sut.cancelPost(request)

        // Then
        XCTAssert(presenterSpy.didPresentCancelledPost)
    }
}
