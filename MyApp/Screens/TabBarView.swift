//
//  ContentView.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 30/07/24.
//

import SwiftUI
import Nuke
import NukeUI

struct TabBarView: View {
    @State private var tabSelection = 1

    var body: some View {
        
        TabView(selection: $tabSelection){
            NavigationStack{
                MoviesView()
            }.tabItem { Label(Constants.moviesTitle, systemImage: Constants.Images.movies) }.tag(1).toolbarBackground(.secondary, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            NavigationStack{
                SearchView(viewModel: SearchViewModel(webService: Webservice()))
            }.tabItem { Label(Constants.searchTitle, systemImage: Constants.Images.search) }.tag(2).toolbarBackground(.secondary, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            
            NavigationStack{
                WatchListView(tabSelection: $tabSelection)
               // WatchListView(movies: nil)

            }.tabItem { Label(Constants.watchlistTitle, systemImage: Constants.Images.watchList) }.tag(3).toolbarBackground(.secondary, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}


#Preview {
    
    TabBarView().environmentObject(MovieModel(webService: MockWebservice()))
}
