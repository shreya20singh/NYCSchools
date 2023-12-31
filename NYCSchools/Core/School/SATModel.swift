import Foundation

struct SATScore: Identifiable, Codable {
    var id: String
    var schoolName: String
    var mathScore: String
    var readingScore: String
    var writingScore: String

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case schoolName = "school_name"
        case mathScore = "sat_math_avg_score"
        case readingScore = "sat_critical_reading_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
}

