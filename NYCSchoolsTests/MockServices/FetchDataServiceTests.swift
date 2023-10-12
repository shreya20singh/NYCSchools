//
//  FetchDataServiceTests.swift
//  NYCSchoolsTests
//
//  Created by Shreya Singh on 10/11/23.
//
import XCTest
@testable import NYCSchools

class FetchDataServiceTests: XCTestCase {
    var fetchService: FetchDataService!

    override func setUp() {
        super.setUp()
        fetchService = FetchDataService()
    }

    override func tearDown() {
        fetchService = nil
        super.tearDown()
    }

    func testFetchNYCSchools() async {
        do {
            let schools = try await fetchService.fetchNYCSchools(page: 1, perPage: 10)
            XCTAssertFalse(schools.isEmpty, "Fetched schools should not be empty")
        } catch {
            XCTFail("Error: \(error)")
        }
    }

    func testFetchMoreSchools() async {
        do {
            let schools = try await fetchService.fetchMoreSchools(page: 2, pageSize: 10)
            XCTAssertFalse(schools.isEmpty, "Fetched schools should not be empty")
        } catch {
            XCTFail("Error: \(error)")
        }
    }
}
