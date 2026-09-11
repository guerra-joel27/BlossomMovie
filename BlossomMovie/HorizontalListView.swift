//
//  HorizontalListView.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 8/23/26.
//

import SwiftUI

struct HorizontalListView: View {
    let header : String
    var titles : [Title]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(titles) { title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                            image // we need the ?? because they are optionals
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    }
                }
            }
        }
        .frame(height: 250)
        .padding(10)
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString, titles: Title.previewTitles)
}
 
