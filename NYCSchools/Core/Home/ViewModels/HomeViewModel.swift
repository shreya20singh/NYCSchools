import Foundation

class HomeViewModel: ObservableObject {
    @Published var schools: [School] = []
    @Published var searchText = ""
    @Published var isShowingErrorAlert = false
    @Published var errorAlertMessage = ""
    @Published var filteredSchools: [School] = []

    private let dataService: FetchDataService
    private var currentPage = 1
    private let pageSize = 10

    init(dataService: FetchDataService) {
        self.dataService = dataService
    }

    func fetchNYCSchools() async {
        do {
            let fetchedSchools = try await dataService.fetchNYCSchools(page: currentPage, perPage: pageSize)
            DispatchQueue.main.async {
                self.schools.append(contentsOf: fetchedSchools)
                self.filteredSchools = self.schools.filter {
                    self.searchText.isEmpty || $0.schoolName.localizedCaseInsensitiveContains(self.searchText)
                }
            }
        } catch {
            handleError(error)
        }
    }

    func refreshSchools() async {
        currentPage = 1
        schools = []
        await fetchNYCSchools()
    }

    func filterSchools() -> [School] {
        filteredSchools = schools.filter {
                searchText.isEmpty || $0.schoolName.localizedCaseInsensitiveContains(searchText)
            }
        return filteredSchools
    }

    func loadMoreSchools(currentSchool: School) async {
        if schools.last == currentSchool {
            currentPage += 1
            await fetchNYCSchools()
        }
    }

    private func handleError(_ error: Error) {
        errorAlertMessage = "Failed to fetch schools. Please try again later."
        isShowingErrorAlert = true
    }
}
