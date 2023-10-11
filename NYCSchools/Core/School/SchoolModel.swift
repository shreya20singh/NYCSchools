//
//  SchoolModel.swift
//  NYCSchools
//
//  Created by Aerologix Aerologix on 10/11/23.
//

import Foundation

struct School: Identifiable, Codable, Equatable {
    var id: String
    var schoolName: String
    var location: String
    var overview: String
    // Add other properties you need for the school information
    
    enum CodingKeys: String, CodingKey {
            case id = "dbn" // Mapping "dbn" to the "id" property
            case schoolName = "school_name"
            case location
            case overview = "overview_paragraph"
            // Add other properties and their respective JSON keys
        }
}
