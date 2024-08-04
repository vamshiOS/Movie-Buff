//
//  GenreTableViewCell.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import SwiftUI

struct GenreTableViewCell: View {
    let section: TableSection
    var body: some View {
        VStack(alignment: .leading){
            Text(section.title.rawValue).font(.title2).foregroundStyle(.white).padding([ .trailing])
            GenreHorizontalCollectionView(movies: section.items)
        }.listRowBackground(Color.black)
    }
}
//#Preview {
//    GenreTableViewCell()
//}
