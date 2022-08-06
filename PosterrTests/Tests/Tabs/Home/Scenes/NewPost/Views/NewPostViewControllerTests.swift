import XCTest
@testable import Posterr

final class NewPostViewControllerTests: XCTestCase {
    // MARK: - Dependencies

    private let presenterSpy = NewPostPresenterSpy()
    private lazy var interactorSpy = NewPostInteractorSpy(presenter: presenterSpy, user: .debugUser1)
    private lazy var routerSpy = NewPostRouterSpy(dataStore: interactorSpy)

    // MARK: - System under test

    private lazy var sut = NewPostViewController(interactor: interactorSpy, router: routerSpy)

    // MARK: - Tests

    func testDisplayDidPostShouldntRouteToParentWhenPostFails() {
        // Given
        let viewModel = NewPost.Post.ViewModel(didSucceed: false)

        // When
        sut.displayDidPost(viewModel)

        // Then
        XCTAssertFalse(routerSpy.didRouteToParent)
    }

    func testDisplayDidPostShouldRouteToParentWhenPostSucceeds() {
        // Given
        let viewModel = NewPost.Post.ViewModel(didSucceed: true)

        // When
        sut.displayDidPost(viewModel)

        // Then
        XCTAssert(routerSpy.didRouteToParent)
    }

    func testDisplayDidCancelShouldRouteToParent() {
        // Given
        let viewModel = NewPost.Cancel.ViewModel()

        // When
        sut.displayDidCancel(viewModel)

        // Then
        XCTAssert(routerSpy.didRouteToParent)
    }

    func testTextViewDidChangeShouldHandleContentChange() {
        // Given
        let textView = UITextView()

        // When
        sut.textViewDidChange(textView)

        // Then
        XCTAssert(interactorSpy.didCallContentChange)
    }
}
