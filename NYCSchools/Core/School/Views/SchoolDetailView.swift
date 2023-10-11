import SwiftUI

struct SchoolDetailView: View {
    @ObservedObject var viewModel: SchoolDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.school.schoolName)
                .font(.title)

            Text("Location: \(viewModel.school.location)")
                .font(.subheadline)

            Text("Overview: \(viewModel.school.overview)")
                .font(.body)

            if viewModel.isLoadingSATScores {
                ProgressView("Loading SAT Scores...")
            } else if let satScores = viewModel.satScores {
                Text("SAT Scores:")
                Text("Critical Reading Avg Score: \(satScores.readingScore)")
                Text("Math Avg Score: \(satScores.mathScore)")
                Text("Writing Avg Score: \(satScores.writingScore)")
            } else {
                Text("SAT Scores: N/A")
            }
        }
        .padding()
        .navigationTitle("School Detail")
    }
}
