//
//  ResultView.swift
//  Calculator
//
//  Created by Prinon bhowmik on 12/10/24.
//

import SwiftUI

struct ResultView: View {
    
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack(spacing: 10){
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundColor(foregroundDigitsColor)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundColor(foregroundDigitsColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }
        }.padding()
    }
}

#Preview {
    ResultView(currentComputation: "5+1", mainResult: "6")
}
