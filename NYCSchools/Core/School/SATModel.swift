//
//  SATModel.swift
//  NYCSchools
//
//  Created by Aerologix Aerologix on 10/11/23.
//

import Foundation

struct SATScore: Identifiable, Codable {
    var id: String
    var schoolName: String
    var mathScore: String
    var readingScore: String
    var writingScore: String
    // Add other properties you need for SAT scores
}
