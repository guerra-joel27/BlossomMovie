//
//  TitleDetailView.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 10/4/26.
//

import SwiftUI

struct TitleDetailView: View {
    let title: Title // we created a Title object, which is an array (?)
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(alignment: .leading) {
                    AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height*0.85)
                    
                    Text((title.name ?? title.title) ?? "")
                        .bold()
                        .font(.title2)
                        .padding(5)
                        .padding(.top, -20)
                    
                    Text(title.overview ?? "")
                        .padding(5)
                }
            }
        }
    }
}

#Preview {
    // here we set it to our placeholder, for testing purposes
    // but above, we created its own Title object to use irl
    TitleDetailView(title: Title.previewTitles[0])
}
