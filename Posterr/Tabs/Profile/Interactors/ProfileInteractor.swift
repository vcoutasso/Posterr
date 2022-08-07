import Foundation

final class ProfileInteractor: ProfileInteractionLogic, ProfileDataStore {
    private(set) var postDataStore: PostDataStore
    private(set) var presenter: ProfilePresentationLogic

    init(presenter: ProfilePresentationLogic, postDataStore: PostDataStore) {
        self.presenter = presenter
        self.postDataStore = postDataStore
    }
}
