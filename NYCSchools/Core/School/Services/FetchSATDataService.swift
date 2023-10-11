//
//  FetchSATDataService.swift
//  NYCSchools
//
//  Created by Aerologix Aerologix on 10/11/23.
//

import Foundation


class FetchSATDataService {

    func fetchSATScores(forDBN dbn: String) async throws -> SATScore? {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") else {
            throw APIError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let scores = try decoder.decode([SATScore].self, from: data)
            return scores.first // Return the first result if available
        } catch {
            throw APIError.requestFailed
        }
    }
}
