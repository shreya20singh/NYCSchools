# 20231011-ShreyaSingh-NYCSchools
## NYCSchools App Features

### School Listing

-   Displays a list of New York City schools.
-   Each school is presented with its name, location, and other key information.
- _File(s): ContentView.swift, FetchNYCSchoolsService.swift_

### Pagination for Improved Performance

-   Implement pagination of the API for app performance improvement.
-   _File(s): FetchNYCSchoolsService.swift_

 ### School Details

View detailed information for a selected school, including:
-   School name.
-   Overview.
-   Contact details (phone, email, website).
-   Address.
-   SAT scores.
-   Location on the map.
- _File(s): SchoolDetailViewModel.swift, SchoolDetail.swift, SchoolLocationMapView.swift, InfoHStack.swift_

### Progressive Loading

Displays a loading indicator while fetching SAT scores
_File(s): SchoolDetailView.swift_

### Reusable Components

Created reusable components for displaying phone numbers, email addresses, and websites.

-   _File(s): InfoHStack.swift_

### Map Integration

Displays the school's location on a map.
_File(s): SchoolLocationMapView.swift_

### Error Handling

Handle potential errors gracefully and display messages to the user in case of issues.
_File(s): SchoolDetailViewModel.swift, Utils/Errors.swift_

### Unit Tests

Added unit tests for both services with Mock data. Given more time, I would add UI Test cases as well.
_File(s): Utils/FetchDataServiceTests.swift, FetchSATDataServiceTests.swift_

![HomePage]![Simulator Screenshot - iPhone 14 Pro - 2023-10-11 at 20 32 46](https://github.com/shreya20singh/NYCSchools/assets/23652464/6d1ab5a9-84bb-484e-817c-355db2e84b42)
![Search](![Simulator Screenshot - iphoneX - 2023-10-11 at 21 31 35](https://github.com/shreya20singh/NYCSchools/assets/23652464/f9d52e75-a63b-4549-9bb0-91f9a7b00dd1)
![SchoolDetail]![Simulator Screenshot - iPhone 14 Pro - 2023-10-11 at 20 32 59](https://github.com/shreya20singh/NYCSchools/assets/23652464/f8038855-b88c-4b75-9236-914a9376e2e4)


