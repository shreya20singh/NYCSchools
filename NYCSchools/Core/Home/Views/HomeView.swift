import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List(viewModel.filteredSchools) { school in
                NavigationLink(destination: SchoolDetailView(school: school)) {
                    VStack(alignment: .leading) {
                        
                        Text(school.schoolName)
                            .font(.headline)
                        Text("Location: \(school.location)")
                            .font(.subheadline)
                    }
                    .onAppear {
                        if school == viewModel.filteredSchools.last {
                            // This is the last school, trigger loading more schools
                            Task {
                                await viewModel.loadMoreSchools(currentSchool: school)
                            }
                        }
                    }
                
                }
            }
            .refreshable {
                Task {
                    await viewModel.refreshSchools()
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchNYCSchools()
                }
            }
            .navigationTitle("NYC High Schools")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText, prompt: "Search")
            .alert(isPresented: $viewModel.isShowingErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorAlertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            await viewModel.fetchNYCSchools()
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
