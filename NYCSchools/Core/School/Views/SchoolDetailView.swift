//
//  SchoolDetailView.swift
//  NYCSchools
//
//  Created by Aerologix Aerologix on 10/11/23.
//

import SwiftUI

struct SchoolDetailView: View {
    let school: School

    var body: some View {
        VStack {
            Text(school.schoolName)
                .font(.title)

            Text("Location: \(school.location)")
                .font(.subheadline)

            Text("Overview: \(school.overview)")
                .font(.body)

            // You can add more details here, such as displaying SAT scores
        }
        .padding()
        .navigationTitle("School Detail")
    }
}

