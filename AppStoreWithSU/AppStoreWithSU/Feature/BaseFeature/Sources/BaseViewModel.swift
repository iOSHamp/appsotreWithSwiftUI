import Foundation
import Combine

open class BaseViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()

    @Published public var isError = false
    @Published public var isLoading = false
    @Published public var errorMessage = ""

    public init() {}

    @MainActor
    public func withAsyncTry<Object: AnyObject>(
        with object: Object,
        action: @escaping (Object) async throws -> Void,
        errorAction: ((Object, Error) -> Void)? = nil
    ) async {
        isLoading = true
        do {
            try await action(object)
            isLoading = false
        } catch {
            if let errorAction = errorAction {
                errorAction(object, error)
            } else {
                isError = true
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
    
    
}
