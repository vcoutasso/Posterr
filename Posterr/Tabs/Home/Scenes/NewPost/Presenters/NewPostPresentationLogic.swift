import Foundation

protocol NewPostPresentationLogic: AnyObject {
    var displayLogicDelegate: NewPostDisplayLogic? { get set }

    func presentUpdatedInterface(response: NewPost.ContentChange.Response)
}

