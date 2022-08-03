import XCTest
@testable import Posterr

class NewPostPresenterTests: XCTestCase {
    // MARK: - Dependencies

    private let displayLogicSpy = NewPostDisplayLogicSpy()

    // MARK: - System under test

    private lazy var sut = NewPostPresenter()

    // MARK: - Setup

    override func setUp() {
        sut.displayLogicDelegate = displayLogicSpy
    }

    // MARK: - Tests

    func testPresentUpdatedInterfaceShouldDisplayUpdatedInterface() {
        // Given
        let response = NewPost.ContentChange.Response(isLengthValid: true, isEmpty: false, maxLength: 1)

        // When
        sut.presentUpdatedInterface(response)

        // Then
        XCTAssert(displayLogicSpy.didCallDisplayUpdatedInterface)
    }

    func testPresentCompletedPostShouldCallDisplayDidPost() {
        // Given
        let response = NewPost.Post.Response(didSucceed: true)

        // When
        sut.presentCompletedPost(response)

        // Then
        XCTAssert(displayLogicSpy.didCallDisplayDidPost)
    }

    func testPresentCancelledPostShouldCallDisplayDidCancel() {
        // Given
        let response = NewPost.Cancel.Response()

        // When
        sut.presentCancelledPost(response)

        // Then
        XCTAssert(displayLogicSpy.didCallDisplayDidCancel)
    }
}
