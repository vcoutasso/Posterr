import XCTest
@testable import Posterr

final class HomePresenterTests: XCTestCase {
    // MARK: - Dependencies

    private let displayLogicSpy = HomeDisplayLogicSpy()

    // MARK: - System under test

    private lazy var sut = HomePresenter()

    // MARK: - Test setup

    override func setUp() {
        sut.displayLogicDelegate = displayLogicSpy
    }

    // MARK: - Tests

    func testPresentNewPostViewShouldDisplayNewPostView() {
        // Given
        let response = Home.NewPost.Response()

        // When
        sut.presentNewPostView(response)

        // Then
        XCTAssert(displayLogicSpy.didDisplayNewPostView)
    }
}
