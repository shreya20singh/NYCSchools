//
//  FetchSATDataServiceTests.swift
//  NYCSchoolsTests
//
//  Created by Shreya Singh on 10/11/23.
//

import XCTest
@testable import NYCSchools

class FetchSATDataServiceTests: XCTestCase {
    var fetchService: FetchSATDataService!

    override func setUp() {
        super.setUp()
        fetchService = FetchSATDataService()
    }

    override func tearDown() {
        fetchService = nil
        super.tearDown()
    }

    // Test the fetchSATScores method
    func testFetchSATScores() async {
        do {
            let dbn = "11X253"  
            let satScore = try await fetchService.fetchSATScores(forDBN: dbn)
            XCTAssertNotNil(satScore, "Fetched SAT scores should not be nil")
        } catch {
            XCTFail("Error: \(error)")
        }
    }
}

