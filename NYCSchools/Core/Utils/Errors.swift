//
//  Errors.swift
//  NYCSchools
//
//  Created by Aerologix Aerologix on 10/11/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidData
    case decodingError
}
