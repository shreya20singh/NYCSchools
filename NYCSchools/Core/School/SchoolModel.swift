struct School: Identifiable, Codable, Equatable {
    var id: String
    var schoolName: String
    var location: String
    var overview: String
    var phoneNumber: String // Add phone number
    var address: String // Add address

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case schoolName = "school_name"
        case location
        case overview = "overview_paragraph"
        case phoneNumber = "phone_number" // Map "phone_number" to "phoneNumber" property
        case address = "primary_address_line_1" // Map "primary_address_line_1" to "address" property
    }
}
