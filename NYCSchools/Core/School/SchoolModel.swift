//
//  SchoolModel.swift
//  NYCSchools
//
//  Created by Aerologix Aerologix on 10/11/23.
//

import Foundation

struct School: Identifiable, Codable {
    var id: String
    var schoolName: String
    var location: String
    var overview: String
    // Add other properties you need for the school information
}
