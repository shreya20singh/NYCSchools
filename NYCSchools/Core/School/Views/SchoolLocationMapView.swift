import MapKit
import SwiftUI

struct SchoolLocationMapView: View {
    @StateObject var viewModel: SchoolDetailViewModel

    var body: some View {
        Map(coordinateRegion: .constant(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: viewModel.school.latitude, longitude: viewModel.school.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        ))
        .frame(height: 200)
        .cornerRadius(10)
        .padding()
    }
}
