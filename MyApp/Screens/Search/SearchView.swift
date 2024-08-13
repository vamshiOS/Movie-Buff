//
//  SearchView.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 05/08/24.
//

import SwiftUI
import Combine
import NukeUI

struct SearchView: View {
    
    @State private var movies = [SearchedMovie]()
    @State private var searchText = ""
    
    private let viewModel: SearchViewModel

    private var searchSubject = CurrentValueSubject<String, Error>("")
    
    @State private var cancellables: Set<AnyCancellable> = []
    init(viewModel: SearchViewModel){
        self.viewModel = viewModel
    }
    
    private  func setupPublisher(){
        searchSubject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { _ in  } receiveValue: { searchText in
            loadMovies(search: searchText)
        }
        .store(in: &cancellables)

    }
    
    private  func loadMovies(search: String){
        viewModel.loadMovies(for: search)
            .sink { _ in } receiveValue: { movies in
                self.movies = movies
            }.store(in: &cancellables)

    }

    var body: some View {
        
        List(movies){ movie in
            SearchedMovieCell(movie: movie)
        }.listStyle(.plain).background(.black).navigationTitle(Constants.searchTitle).searchable(text: $searchText)
            .onChange(of: searchText) {
                if !searchText.isEmpty{
                    searchSubject.send(searchText)
                }
            }.onAppear{
                setupPublisher()
            }
    }
}

#Preview {
    NavigationStack{
        SearchView(viewModel: SearchViewModel(webService: Webservice()))
    }.background(.white)
}

struct SearchedMovieCell: View {
    let movie: SearchedMovie
    var body: some View {
        HStack{
            LazyImage(url: URL(string: movie.poster)){ state in
                if let image = state.image {
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 90).clipShape(RoundedRectangle(cornerRadius: 4)).padding(5).cornerRadius(4)
                } else if state.error != nil {
                    PlaceholderView(width: 60, height: 90, cornerRadius: 4, padding: 5)// Indicates an error
                } else {
                    PlaceholderView(width: 60, height: 90, cornerRadius: 4, padding: 5)
                }
            }
            VStack(alignment: .leading){
                Text(movie.title).font(.system(size: 16, weight: .medium)).foregroundStyle(.white)
                Text(movie.year).font(.system(size: 13)).foregroundStyle(.gray)
            }
        }.listRowBackground(Color.black)
    }
}
