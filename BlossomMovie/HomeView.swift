//
//  HomeView.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 8/22/26.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: heroTestTitle)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text(Constants.playString)
                        .ghostButton()
                }
                Button {
                    
                } label: {
                    Text(Constants.downloadString)
                        .ghostButton()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
