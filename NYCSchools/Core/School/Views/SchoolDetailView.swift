import SwiftUI
import MapKit

struct SchoolDetailView: View {
    @ObservedObject var viewModel: SchoolDetailViewModel
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.school.schoolName)
                .font(.title)
                .fontWeight(.semibold)

            Text("Overview: " + viewModel.school.overview)
                .font(.subheadline)

            VStack(alignment: .leading) {
                Text("Phone: " + viewModel.school.phoneNumber)
                    .font(.subheadline)

                if let email = viewModel.school.email {
                    Text("Email: " + email)
                        .font(.subheadline)
                }

                if let website = viewModel.school.website {
                    Text("Website: " + website)
                        .font(.subheadline)
                }
            }

            if viewModel.isLoadingSATScores {
                ProgressView("Loading SAT Scores...")
            } else if let satScores = viewModel.satScores {
                Text("SAT Scores:")
                Text("Critical Reading Avg Score: " + satScores.readingScore)
                Text("Math Avg Score: " + satScores.mathScore)
                Text("Writing Avg Score: " + satScores.writingScore)
            } else {
                Text("SAT Scores: N/A")
            }

            Text("Address: \(viewModel.school.address)")
                .font(.subheadline)

            SchoolLocationMapView(viewModel: viewModel)
                .frame(height: 200)
        }
        .padding()
        .onAppear {
            let coordinate = CLLocationCoordinate2D(
                latitude: viewModel.school.latitude,
                longitude: viewModel.school.longitude
            )
            region.center = coordinate
        }
        .navigationTitle("School Detail")
    }
}
