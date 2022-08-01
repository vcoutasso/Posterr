import Foundation

protocol HomePresentationLogic: AnyObject {
    var displayLogicDelegate: HomeDisplayLogic? { get set }
}
