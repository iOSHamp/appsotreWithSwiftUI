import Foundation
import SwiftUI
import Combine

enum RootViewAction {
    case recommandedTextDidTap(String)
}


final class RootViewModel: BaseViewModel {
   
    
    let results =  [
        "김서근", "포뇨", "하울", "소피아", "캐시퍼", "소스케",
        "치히로", "하쿠", "가오나시", "제니바", "카브", "마르클",
        "토토로", "사츠키", "지브리", "스튜디오", "캐릭터"
    ]
    @Published var searchText: String = ""
    @Published var searchResult: [String] = []
    @Published var action: RootViewAction?
    
    override init() {
        super.init()
        bindState()
        bindAction()
    }
    
}

extension RootViewModel {
    
    func bindState()  {
        
            $searchText
            .withUnretained(self)
            .removeDuplicates(by: { $0.1 == $1.1})
            .map { owner,text -> [String] in
                
                guard !text.isEmpty else {
                    return owner.results
                }
                return owner.results.filter{$0.hasPrefix(text)}.sorted()
            }
            .print("HH")
            .eraseToAnyPublisher()
            .assign(to: &$searchResult)
        
    }
    
    func bindAction() {
        
        $action
            .withUnretained(self)
            .print("DEUBG")
            .sink { owner, action  in
                guard let action = action else {
                    return
                }
                
                switch action {
                    
                    case let .recommandedTextDidTap(text):
                        owner.searchText = text
                        break
                    
                }
            }
            .store(in: &subscription)
        
    }
}


