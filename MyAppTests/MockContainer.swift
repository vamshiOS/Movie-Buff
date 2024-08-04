//
//  MockContainer.swift
//  MyAppTests
//
//  Created by Vamshi Krishna Reddy Gurijala on 02/08/24.
//

import Foundation
import SwiftData

var mockContainer: ModelContainer{
    do{
        let container = try ModelContainer(for: LocalMovie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        print("new container")
        return container
    }
    catch{
        fatalError("Failed to create a mock Container")
    }
}
