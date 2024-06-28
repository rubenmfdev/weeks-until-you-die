//
//  WeeksView.swift
//  WUYD
//
//  Created by Ruben Marquez on 28/6/24.
//

import Foundation
import SwiftUI

struct WeeksView: View {
    var body: some View {
        VStack {
            Text("Success!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("You have successfully selected your birthday.")
                .font(.title2)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct WeeksView_Previews: PreviewProvider {
    static var previews: some View {
        WeeksView()
    }
}
