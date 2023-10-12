//
//  NYCSchoolsApp.swift
//  NYCSchools
//
//  Created by Shreya Singh on 10/11/23.
//

import SwiftUI

@main
struct NYCSchoolsApp: App {
    @StateObject private var viewModel = HomeViewModel(dataService: FetchDataService())
    private let fetchSATDataService = FetchSATDataService()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: viewModel, fetchSATDataService: fetchSATDataService)
        }
    }
}
