//
//  SearchViewModel.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 05/08/24.
//

import Foundation
import Combine


class SearchViewModel{
    
    @Published private(set) var movies: [SearchedMovie] = []

    let webService: NetworkService
    
    init(webService: NetworkService) {
        self.webService = webService
    }
    
     func loadMovies(for searchText: String) -> AnyPublisher<[SearchedMovie], Error>{
         return self.webService.loadMovies(for: searchText)
    }
}
