import SwiftUI

struct InfoHStack: View {
    var text: String
    var value: String

    var body: some View {
        HStack {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .font(.subheadline)
        }
    }
}
