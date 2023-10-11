//
//  FetchDataService.swift
//  NYCSchools
//
//  Created by Shreya Singh on 10/11/23.
//

import Foundation

class FetchDataService {
    
    func fetchNYCSchools(page: Int, perPage: Int) async throws -> [School] {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            throw APIError.invalidURL
        }
        
        let queryItems = [
            URLQueryItem(name: "$limit", value: String(perPage)),
            URLQueryItem(name: "$offset", value: String((page - 1) * perPage)),
            // Add other query parameters as needed
        ]

        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw APIError.invalidURL
        }
        
        components.queryItems = queryItems
        
        if let urlWithQuery = components.url {
            let (data, _) = try await URLSession.shared.data(from: urlWithQuery)

            do {
                let decoder = JSONDecoder()
                let schools = try decoder.decode([School].self, from: data)
                return schools
            } catch {
                print("Error in fetchNYCSchools: \(error)")
                throw APIError.decodingError
            }
        } else {
            throw APIError.invalidURL
        }
    }

    
    func fetchMoreSchools(page: Int, pageSize: Int) async throws -> [School] {
            // Adjust the API request to include the page/offset parameter
            guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
                throw APIError.invalidURL
            }

            // Add a parameter to specify the page
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            let pageQueryItem = URLQueryItem(name: "$offset", value: String((page - 1) * pageSize))
            urlComponents?.queryItems = [pageQueryItem]

            if let modifiedURL = urlComponents?.url {
                let (data, _) = try await URLSession.shared.data(from: modifiedURL)
                let decoder = JSONDecoder()
                return try decoder.decode([School].self, from: data)
            } else {
                throw APIError.invalidURL
            }
        }

    func fetchSATScores() async throws -> [SATScore] {
            guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else {
                throw APIError.invalidURL
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                return try decoder.decode([SATScore].self, from: data)
            } catch {
                throw APIError.requestFailed
            }
        }
}
