import SwiftUI

struct SchoolCellView: View {
    let school: School
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(school.schoolName)
                .font(.headline)
                .fontWeight(.bold)
            
            Text("Address: \(school.address)")
                .font(.subheadline)
            
            Text("Phone: \(school.phoneNumber)")
                .font(.subheadline)
        }
        .padding()
    }
}
