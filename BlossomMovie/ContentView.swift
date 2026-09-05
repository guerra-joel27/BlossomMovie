//
//  ContentView.swift
//  BlossomMovie
//
//  Created by Joel Guerra on 8/22/26.
//
/*
this file here is basically the central hub for our application. this will be where we pretty much connect
 all of our views together for the applicaton!
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Constants.homeString, systemImage: Constants.homeIconString) {
                HomeView()
            }
            Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString) {
                Text(Constants.upcomingString)
            }
            Tab(Constants.searchString, systemImage: Constants.searchIconString) {
                Text(Constants.searchString)
            }
            Tab(Constants.downloadString, systemImage: Constants.downloadIconString) {
                Text(Constants.downloadString)
            }
        }
    }
}

#Preview {
    ContentView()
}
 
