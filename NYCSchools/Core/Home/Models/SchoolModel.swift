struct School: Identifiable, Codable, Equatable {
    var id: String
    var schoolName: String
    var location: String
    var overview: String
    var phoneNumber: String
    var address: String
    var email: String?
    var website: String?
    var latitude: Double
    var longitude: Double
// We can add more feilds from the api based on requirements
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case schoolName = "school_name"
        case location
        case overview = "overview_paragraph"
        case phoneNumber = "phone_number"
        case address = "primary_address_line_1"
        case email = "school_email"
        case website
        case latitude
        case longitude
    }
/*decoding the api based on needs. If any of the keys is empty, this code will add intialize it to nil
 also, coverted long lat values from String to Double
 */
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        schoolName = try container.decode(String.self, forKey: .schoolName)
        location = try container.decode(String.self, forKey: .location)
        overview = try container.decode(String.self, forKey: .overview)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        address = try container.decode(String.self, forKey: .address)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        website = try container.decodeIfPresent(String.self, forKey: .website)
        latitude = (try container.decodeIfPresent(String.self, forKey: .latitude) ?? "0").doubleValue
        longitude = (try container.decodeIfPresent(String.self, forKey: .longitude) ?? "0").doubleValue
    }
}

extension String {
    var doubleValue: Double {
        return Double(self) ?? 0.0
    }
}
