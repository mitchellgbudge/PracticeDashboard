//
//  DashboardMainView.swift
//  PracticeDashboard
//
//  Created by Mitchell Budge on 7/14/22.
//

import SwiftUI

struct DashboardMainView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Jersey Oncology Practice Dashboard")
                .font(.largeTitle)
                .bold()
            HStack {
                VisitListView()

                InsightsView()

                VStack {
                    Text("Weather")

                    Form {
                        Text("Feed 1")
                        Text("Feed 2")
                        Text("Feed 3")
                    }
                }
            }
        }
    }
}

struct InsightsView: View {

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                InsightContainerView(title: "Today's efficiency", color: .green, isIncreased: true, value: "71%")
                InsightContainerView(title: "Total patients today", color: .green, isIncreased: false, value: "50")
                InsightContainerView(title: "Total staff today", color: .yellow, isIncreased: false, value: "42/45")
                InsightContainerView(title: "Total patients in infusion", color: .yellow, isIncreased: true, value: "20")
            }
            .padding(.vertical, 40)

            Section {
                HStack {
                    Circle()
                    Circle()
                }
            } header: {
                HStack {
                    Text("Today's Trends")
                    Spacer()
                }
            }

            Section("Highlights") {
                Text("Highlights")
            }
        }
    }

    struct InsightContainerView: View {

        let title: String
        let color: Color
        let isIncreased: Bool
        let value: String

        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                HStack {
                    Image(systemName: isIncreased ? "arrow.up.circle.fill" : "arrow.down.circle.fill")
                        .background(color)

                    Spacer()

                    Text(value)
                }
            }
            .border(.quaternary)
            .background(.quaternary)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10.0)
        }
    }
}

struct DashboardMainView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardMainView()
    }
}
