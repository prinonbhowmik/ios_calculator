//
//  ButtonView.swift
//  Calculator
//
//  Created by Prinon bhowmik on 12/10/24.
//

import SwiftUI

struct CalcButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
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
    CalcButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
