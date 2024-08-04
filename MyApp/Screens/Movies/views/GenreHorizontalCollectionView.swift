//
//  GenreHorizontalCollectionView.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import SwiftUI

struct GenreHorizontalCollectionView: View {
    let movies: [Movie]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(movies) { movie in
                    MovieCollectionViewCell(movie: movie)
                }
            }
        }
    }
}

//#Preview {
//    GenreHorizontalCollectionView()
//}
