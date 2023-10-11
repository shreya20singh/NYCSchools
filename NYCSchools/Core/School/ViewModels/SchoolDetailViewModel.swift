//
//  SchoolDetailViewModel.swift
//  NYCSchools
//
//  Created by Shreya Singh on 10/11/23.
//

import Foundation
import SwiftUI

class SchoolDetailViewModel: ObservableObject {
    @Published var school: School
    @Published var satScores: SATScore?
    @Published var isLoadingSATScores = false

    private let dataService: FetchSATDataService

    init(school: School, dataService: FetchSATDataService) {
        self.school = school
        self.dataService = dataService
        loadSATScores()
    }

    func loadSATScores() {
        isLoadingSATScores = true
        Task {
            do {
                let scores = try await dataService.fetchSATScores(forDBN: self.school.id)
                DispatchQueue.main.async {
                    self.satScores = scores
                    self.isLoadingSATScores = false
                }
            } catch {
                // Handle error
                print("Error loading SAT scores: \(error)")
                self.isLoadingSATScores = false
            }
        }
    }

}
