//
//  MovieCollectionViewCell.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import SwiftUI
import NukeUI

struct MovieCollectionViewCell: View{
    
    let movie: Movie
    var body: some View{
        NavigationLink(destination: MovieDetailView(movie: movie)){
            LazyImage(url: URL(string: movie.poster_path)){ state in
                if let image = state.image {
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 180).clipShape(RoundedRectangle(cornerRadius: 4)).padding(5).cornerRadius(4)
                   } else if state.error != nil {
                       Color.red // Indicates an error
                   } else {
                       PlaceholderView(width: 120, height: 180, cornerRadius: 4, padding: 5)
                   }
            }
        }
    }
}

struct PlaceholderView: View {
    let width: Double
    let height: Double
    let cornerRadius: Double?
    let padding: Double?
    var body: some View {
        
        Color.secondary
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius ?? 0)).padding(padding ?? 0).cornerRadius(cornerRadius ?? 0)
    }
}

//#Preview {
//    MovieCollectionViewCell()
//}
