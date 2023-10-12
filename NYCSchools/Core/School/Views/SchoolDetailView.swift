import SwiftUI
import MapKit

struct SchoolDetailView: View {
    @ObservedObject var viewModel: SchoolDetailViewModel
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var isOverviewExpanded = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.school.schoolName)
                .font(.title)
                .fontWeight(.semibold)

            Text("Overview")
                .font(.headline)
            if isOverviewExpanded {
                Text(viewModel.school.overview)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                Text(viewModel.school.overview)
                    .font(.subheadline)
                    .lineLimit(5)
            }
            
            Button(action: {
                    isOverviewExpanded.toggle()
                }) {
                    Text(isOverviewExpanded ? "Read Less" : "Read More")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.top, 5)
            
            Divider()

            VStack(alignment: .leading, spacing: 2) {
                //Using reusable component InfoHStack
                InfoHStack(text: "Phone:", value: viewModel.school.phoneNumber)
                InfoHStack(text: "Email:", value: viewModel.school.email ?? "N/A")
                InfoHStack(text: "Website:", value: viewModel.school.website ?? "N/A")
            }

            Divider()
            
            GeometryReader { geometry in
                            ZStack {
                                Rectangle()
                                    .fill(Color.secondary.opacity(0.5))
                                    .frame(height: geometry.size.height)
                                    .cornerRadius(8)
                                
                                VStack {
                                    if viewModel.isLoadingSATScores {
                                        ProgressView("Loading SAT Scores...")
                                    } else if let satScores = viewModel.satScores {
                                        Text("SAT Scores:")
                                            .font(.headline)
                                        VStack{
                                            InfoHStack(text: "Reading Avg Score:", value: satScores.readingScore)
                                            InfoHStack(text: "Math Avg Score:", value: satScores.writingScore)
                                            InfoHStack(text: "Writing Avg Score:", value: satScores.writingScore)
                                        }
                                        .padding()
                                    } else {
                                        Text("SAT Scores: N/A")
                                    }
                                }
                            }
                        }
            
            Divider()
            
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
