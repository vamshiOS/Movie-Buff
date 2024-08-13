//
//  MoviesView.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject private var model: MovieModel
    @Environment(NetworkMonitor.self) private var networkMonitor
    
    @State private var errorMessage: String?

    func populateMovies() async{
        print("populateMovies")
        do{
            try await model.populateMovies()
        }
        catch{
            errorMessage = error.localizedDescription
            print("error description : \(error.localizedDescription)")
        }
    }
    
    var body: some View {
     
            ZStack{
                Color.black.ignoresSafeArea()
                if networkMonitor.isConnected && model.sections.isEmpty && errorMessage == nil{
                    ProgressView().tint(.white)
                        .task {
                            await populateMovies()
                        }
                }
                else{
                    if errorMessage != nil{
                        Text(errorMessage ?? "").foregroundStyle(.white)
                    }
                    else{
                        List{
                            if(!networkMonitor.isConnected && model.sections.isEmpty){
                                ZStack{
                                    Color.black.ignoresSafeArea()
                                    VStack{
                                        Text("No internet connection").font(.headline).foregroundStyle(.white)
                                        Text("Please connect to internet and try again").font(.caption).foregroundStyle(.gray)
                                    }
                                }
                            }
                            else{
                                ForEach(model.sections){section in
                                    GenreTableViewCell(section: section)
                                }
                            }
                           
                        }.accessibilityIdentifier(Constants.Identifiers.moviesList).navigationTitle(Constants.moviesTitle).refreshable {
                            await populateMovies()
                        }.listStyle(.plain)
                            .background(Color.black)
                    }
                    
                    
                }
            }
        
        
    }
}


//#Preview {
//    MoviesView()
//}
