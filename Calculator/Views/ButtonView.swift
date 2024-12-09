//
//  ButtonView.swift
//  Calculator
//
//  Created by Prinon bhowmik on 12/10/24.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    var body: some View {
        Text(currentComputation)
        Text(mainResult)
    }
}

#Preview {
    ButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
