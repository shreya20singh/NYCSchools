////
////  MockDataService.swift
////  NYCSchoolsTests
////
////  Created by Aerologix Aerologix on 10/11/23.
////
//
//import Foundation
//import XCTest
//import NYCSchools
//
//class MockDataService: FetchDataService {
//    
//    func fetchNYCSchools() async throws -> [School] {
//        // Simulate a successful response with mock data
//        let mockSchools: [School] = [
//            School(
//                dbn: "DBN1",
//                schoolName: "Mock School 1",
//                location: "Mock Location 1"
//            ),
//            School(
//                dbn: "DBN2",
//                schoolName: "Mock School 2",
//                location: "Mock Location 2"
//            )
//            // Add more mock schools as needed
//        ]
//        return mockSchools
//    }
//
//    func fetchSATScores() async throws -> [SATScore] {
//        // Simulate a successful response with mock data
//        let mockScores: [SATScore] = [
//            SATScore(
//                dbn: "DBN1",
//                mathScore: "Mock Math Score 1",
//                readingScore: "Mock Reading Score 1",
//                writingScore: "Mock Writing Score 1"
//            ),
//            SATScore(
//                dbn: "DBN2",
//                mathScore: "Mock Math Score 2",
//                readingScore: "Mock Reading Score 2",
//                writingScore: "Mock Writing Score 2"
//            )
//            // Add more mock SAT scores as needed
//        ]
//        return mockScores
//    }
//}
