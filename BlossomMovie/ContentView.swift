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
                HomeView() // as of 9/27/26, this is the only one we have done out of the four
            }
            Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString) {
                Text(Constants.upcomingString) // placeholder!
            }
            Tab(Constants.searchString, systemImage: Constants.searchIconString) {
                Text(Constants.searchString) // placeholder!
            }
            Tab(Constants.downloadString, systemImage: Constants.downloadIconString) {
                Text(Constants.downloadString) // placeholder!
            }
        }
    }
}

#Preview {
    ContentView()
}
 
