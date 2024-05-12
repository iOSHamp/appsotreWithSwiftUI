import Foundation
import Combine

public extension Publisher {
    
    func withUnretained<O: AnyObject>(_ owner: O) -> Publishers.CompactMap<Self,(O,Self.Output)> {
        compactMap { [weak owner] output in
            guard let owner = owner else {
                return nil
            }
            return (owner, output)
        }
    }
    
}
