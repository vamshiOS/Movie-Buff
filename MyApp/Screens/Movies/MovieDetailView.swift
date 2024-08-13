//
//  MovieDetailView.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 31/07/24.
//

import SwiftUI
import NukeUI
import SwiftData

struct MovieDetailView: View {
    
    let movie: Movie

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    LazyImage(url: URL(string: movie.backdrop_path)){ state in
                        if let image = state.image {
                            image.resizable().aspectRatio(contentMode: .fit).frame(maxWidth: .infinity )
                           } else if state.error != nil {
                               Color.red // Indicates an error
                           } else {
                              
                           }
                        
                    }
                    Text(movie.title).font(.title).foregroundStyle(.white).padding([.top, .leading, .trailing])
                    Text(movie.genres.map({$0.rawValue }).joined(separator: ", ")).font(.caption).foregroundStyle(.gray).padding(.horizontal)
                    Text(movie.overview).font(.headline).foregroundStyle(.white).padding(.all)
                    WatchListButton(movie: movie).padding(.horizontal)
                   
                    Spacer()
                }
            }
            .background(.black)
        }.navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    MovieDetailView(movie: Movie(_id: 868759, backdrop_path: "https://image.tmdb.org/t/p/original/b9UCfDzwiWw7mIFsIQR9ZJUeh7q.jpg", genres: [.actionAndAdventure, .comedy, .romance], original_title: "Ghosted", overview: "Salt-of-the-earth Cole falls head over heels for enigmatic Sadie — but then makes the shocking discovery that she’s a secret agent. Before they can decide on a second date, Cole and Sadie are swept away on an international adventure to save the world.", poster_path: "https://image.tmdb.org/t/p/original/liLN69YgoovHVgmlHJ876PKi5Yi.jpg", release_date: "2023-04-18", title: "Ghosted", contentType: "movie")).modelContainer(for: [LocalMovie.self])
}


struct WatchListButton: View {
    @Environment(\.modelContext) private var context
    @Query private var movies: [LocalMovie]

    let movie: Movie
    
    
    
    func saveOrDeleteMovie(movie: Movie){
        let localMovie = LocalMovie(_id: movie._id, backdrop_path: movie.backdrop_path, genres: movie.genres, original_title: movie.original_title, overview: movie.overview, poster_path: movie.poster_path, release_date: movie.release_date, title: movie.title, contentType: movie.contentType)
        
        if doesExist{
            if let localMovie = localMovie.fetchMovie(context: context, id: movie._id){
                do{
                   try localMovie.delete(context: context)
                }
                catch{
                    if let err = error as? LocalMoviewError{
                        print("error : \(String(describing: err.errorDescription))")
                    }
                }
            }
        }
        else{
           
            do{
                try localMovie.save(context: context)
            }
            catch{
                if let err = error as? LocalMoviewError{
                    print("error : \(String(describing: err.errorDescription))")
                }
            }
        }
       
    }
    
    var doesExist:Bool{
       return movies.map({$0._id}).contains(movie._id)
    }
    
    var body: some View {
        Button(action: {
            saveOrDeleteMovie(movie: movie)
        }
        , label: {
            Text( doesExist ? Constants.removeFromWatchListTitle : Constants.addToWatchListButtonTitle).font(.headline).foregroundStyle(.white).accessibilityIdentifier(Constants.Identifiers.addToWatchListButton)
        }).padding().background(doesExist ? Color.red : Color.blue).cornerRadius(6)
    }
}
