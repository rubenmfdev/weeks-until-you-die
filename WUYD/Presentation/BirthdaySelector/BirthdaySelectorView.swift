//
//  BirthdaySelectorView.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import SwiftUI

struct BirthdaySelectorView: View {
    @StateObject private var viewModel = BirthdaySelectorViewModel()
    var onDone: () -> Void

    var body: some View {
        VStack {
            Text("Select your Birthday")
                .font(.headline)
                .padding()
            
            DatePicker("Birthday", selection: $viewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            Button("Done") {
                onDone()
            }
            .padding()
        }
        .padding()
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct BirthdaySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdaySelectorView(onDone: {})
    }
}

