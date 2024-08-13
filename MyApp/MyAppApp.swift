//
//  MyAppApp.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 30/07/24.
//

import SwiftUI
import SwiftData

struct ModelContainerFactory {
   
    @MainActor static func create() -> ModelContainer {
        
        var container: ModelContainer!
        
        let configuration = ModelConfiguration(for: LocalMovie.self, isStoredInMemoryOnly: false)
        container = try! ModelContainer(for: LocalMovie.self, configurations: configuration)
        
        if ProcessInfo.processInfo.arguments.contains("UITEST") {
            try! container.mainContext.delete(model: LocalMovie.self)
        }
        
        return container
    }
}

@main
struct MyAppApp: App {
    
    @StateObject private var model: MovieModel
    var container: ModelContainer
    @State private var networkMonitor = NetworkMonitor()

    init() {
        container = ModelContainerFactory.create()
        _model = StateObject(wrappedValue: MovieModel(webService: ProcessInfo.processInfo.arguments.contains("UITEST") ? MockWebservice() : Webservice()))
        let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
            navigationBarAppearance.backgroundColor = UIColor.black
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark


    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView().environmentObject(model).environment(networkMonitor)
            .modelContainer(container)
        }
    }
}
