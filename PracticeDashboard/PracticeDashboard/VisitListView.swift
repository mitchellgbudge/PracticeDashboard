//
//  VisitListView.swift
//  PracticeDashboard
//
//  Created by Mitchell Budge on 7/14/22.
//

import SwiftUI

struct VisitListView: View {

    var body: some View {
        Form {
            VisitListRow(time: "08:30", lastName: "Craft", firstName: "Natalie", gender: "F", age: "70", mrn: "91236852", status: .ready)
            VisitListRow(time: "09:00", lastName: "Appleton", firstName: "Bobby", gender: "M", age: "68", mrn: "81006599", status: .waiting)
            VisitListRow(time: "09:30", lastName: "Johnson", firstName: "Beth", gender: "F", age: "67", mrn: "91967921", status: .lab)
            VisitListRow(time: "10:00", lastName: "Laing", firstName: "Morgan", gender: "F", age: "75", mrn: "51368513", status: .checkedIn)
            VisitListRow(time: "10:30", lastName: "Osborn", firstName: "Maxwell", gender: "M", age: "60", mrn: "71065148", status: .scheduled)
            VisitListRow(time: "11:00", lastName: "Smith", firstName: "Sally", gender: "F", age: "68", mrn: "91236852", status: .scheduled)
            VisitListRow(time: "11:30", lastName: "Craft", firstName: "Natalie", gender: "F", age: "70", mrn: "40561820", status: .scheduled)
        }
    }

    struct VisitListRow: View {

        enum Status: String {
            case ready, waiting, lab, checkedIn, scheduled

            var value: String {
                switch self {
                case .ready: return "Ready for Visit"
                case .checkedIn: return "Checked In"
                default: return self.rawValue.capitalized
                }
            }

            var color: Color {
                switch self {
                case .ready: return .blue
                case .waiting: return .orange
                case .lab: return .yellow
                case .checkedIn: return .green
                case .scheduled: return .secondary
                }
            }
        }

        let time: String
        let lastName: String
        let firstName: String
        let gender: String
        let age: String
        let mrn: String
        let status: Status

        var patientDetails: String {
            return lastName + ", " + firstName + " (\(gender)), " + age
        }

        var body: some View {
            HStack(alignment: .center, spacing: 24.0) {
                VStack {
                    Text(time)
                        .font(.caption)
                        .bold()
                    Text("AM")
                        .font(.caption2)
                        .bold()
                }
                .foregroundColor(.secondary)

                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)

                VStack(alignment: .leading, spacing: 8.0) {
                    Text(patientDetails)
                    Text("MRN: \(mrn)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(" \(status.value) ")
                        .background(status.color, in: Capsule())
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 8.0)
        }

    }
}

struct VisitListView_Previews: PreviewProvider {
    static var previews: some View {
        VisitListView()
    }
}
