import Foundation

protocol ProfilePresentationLogic: AnyObject {
    var displayLogicDelegate: ProfileDisplayLogic? { get set }
}
