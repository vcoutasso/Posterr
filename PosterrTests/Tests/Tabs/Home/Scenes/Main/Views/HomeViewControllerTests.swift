import XCTest
@testable import Posterr

final class HomeViewControllerTests: XCTestCase {
    // MARK: - Dependencies

    private let presenterSpy = HomePresenterSpy()
    private lazy var interactorSpy = HomeInteractorSpy(presenter: presenterSpy)
    private lazy var routerSpy = HomeRouterSpy(dataStore: interactorSpy)
    

    // MARK: - System under test

    private lazy var sut = HomeViewController(interactor: interactorSpy, router: routerSpy)

    // MARK: - Setup

    override func setUp() {
        presenterSpy.displayLogicDelegate = sut
    }

    // MARK: - Tests

    func testDisplayNewPostViewShouldRouteToNewPost() {
        // Given
        let viewModel = Home.NewPost.ViewModel()

        // When
        sut.displayNewPostView(viewModel)

        // Then
        XCTAssert(routerSpy.didCallRouteToNewPost)
    }
}
