//
//  NYCSchoolsApp.swift
//  NYCSchools
//
//  Created by Aerologix Aerologix on 10/11/23.
//

import SwiftUI

@main
struct NYCSchoolsApp: App {
    @StateObject private var viewModel = HomeViewModel(dataService: FetchDataService())
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: viewModel)
        }
    }
}
