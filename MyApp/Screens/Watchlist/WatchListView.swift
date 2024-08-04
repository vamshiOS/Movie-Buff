//
//  WatchListView.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import SwiftUI
import SwiftData
import NukeUI

struct WatchListView: View {
    @Binding var tabSelection: Int
    @Environment(\.modelContext) private var context
    @Query private var movies: [LocalMovie]
//    let movies: [Movie]?


    private func deleteMovie(indexSet: IndexSet){
        indexSet.forEach { index in
            let movie = movies[index]
            do{
               try movie.delete(context: context)
            }
            catch{
                print("failed to delete")
            }
        }
    }
    var body: some View {
        
        if movies.isEmpty{
            ZStack{
                Color.black
                VStack{
                    Text("Your list is empty").font(.largeTitle).fontWeight(.semibold).foregroundStyle(.white)
                    Button(action: {
                        tabSelection = 1
                    }, label: {
                        Text("Find something to watch").fontWeight(.semibold)
                    }).padding().background(Color.blue).foregroundStyle(.white).cornerRadius(4)
                }
            }.navigationTitle(Constants.watchlistTitle)
           
        }
        else{
            List{
                ForEach(movies){ movie in
                    WatchlistTableViewCell(movie: movie)
                }.onDelete(perform: deleteMovie)
            }.listStyle(.plain)
                .background(Color.black).navigationTitle(Constants.watchlistTitle)
        }

       
    }
}

//#Preview {
//
//    WatchListView(tabSelection: <#T##Binding<Int>#>).modelContainer(for: [LocalMovie.self])
//}

struct WatchlistTableViewCell: View {
    let movie: LocalMovie
    var body: some View {
        HStack(alignment: .top){
            LazyImage(url: URL(string: movie.poster_path)){ state in
                if let image = state.image {
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 90).clipShape(RoundedRectangle(cornerRadius: 4)).padding(5).cornerRadius(4)
                } else if state.error != nil {
                    Color.red // Indicates an error
                } else {
                    Image(systemName: "photo") // Acts as a placeholder
                }
            }
            
            VStack(alignment: .leading){
//                HStack{
                Text(movie.title).font(.system(size: 16, weight: .semibold)).foregroundStyle(.white)
//                    Text("(\(movie.release_date))").font(.title3).italic()
//                }
                Text(movie.genres.map({$0.rawValue}).joined(separator: ",")).font(.caption).foregroundStyle(.gray).padding([.trailing])
                Text(movie.overview).font(.system(size: 12, weight: .regular)).foregroundStyle(.white).lineLimit(3)

            }.padding(.zero)
            Spacer()
        }.padding(.zero).listRowBackground(Color.black)
    }
}
