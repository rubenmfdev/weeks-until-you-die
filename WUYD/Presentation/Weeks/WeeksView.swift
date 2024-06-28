//
//  WeeksView.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import SwiftUI

struct WeeksView: View {
    @StateObject private var viewModel = WeeksViewModel()
    @State private var zoomLevel: CGFloat = 0.5
    @State private var lastZoomLevel: CGFloat = 0.5
    let maxZoomLevel: CGFloat = 3.0
    let minZoomLevel: CGFloat = 0.2
    private var cellSize: CGFloat {
        return 50 * zoomLevel
    }
    
    private var fontSize: CGFloat {
        return cellSize * 0.3
    }
    
    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: cellSize))]
    }
    
    var body: some View {
        VStack {
            Text("Weeks Until You Die!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    let range = 0..<self.viewModel.totalWeeks
                    ForEach(range, id: \.self) { index in
                        Rectangle()
                            .fill(getFillColor(index))
                            .frame(width: cellSize, height: cellSize)
                            .overlay(
                                Text("\(index)")
                                    .foregroundColor(.white)
                                    .font(.system(size: fontSize))
                            )
                    }
                }
                .padding()
            }
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        let newZoomLevel = lastZoomLevel * value
                        if newZoomLevel > minZoomLevel && newZoomLevel < maxZoomLevel {
                            zoomLevel = newZoomLevel
                        }
                    }
                    .onEnded { value in
                        lastZoomLevel = zoomLevel
                    }
            )
            .scrollIndicators(.hidden)
            Spacer()
        }
        .padding()
    }
}

private extension WeeksView {
    func getFillColor(_ index: Int) -> Color {
        return index > viewModel.weeksLived ? Color.blue : Color.black
    }
}

struct WeeksView_Previews: PreviewProvider {
    static var previews: some View {
        WeeksView()
    }
}
