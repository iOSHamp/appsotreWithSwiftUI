import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @StateObject var viewModel = RootViewModel()
    

    
    var body: some View {
        NavigationStack {
            VStack {
                SearchView(text: $viewModel.searchText)
                List {
                    ForEach(viewModel.searchResult, id:\.self) { searchText in
                        Text(searchText).onTapGesture {
                            viewModel.action = .recommandedTextDidTap(searchText)
                        }
                        
                    }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("검색")
            .navigationBarItems(trailing:HStack{
                                        Button(action: {}) {
                                            HStack {
                                                Text("임시")
                                                    .foregroundColor(.black)
                                                Image(systemName: "folder.fill")
                                            }
                                        }
                                    }
                                )
        }

    }


}

#Preview {
    ContentView()
       
}
