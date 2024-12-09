//
//  ContentView.swift
//  Calculator
//
//  Created by Prinon bhowmik on 12/10/24.
//

import SwiftUI

struct MainView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        ZStack() {
            primaryBackgroundColor
                .ignoresSafeArea()
            
            VStack {
                
                TopButtonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation{
                            lightMode.toggle()
                        }
                    }
                
                Spacer()
                
                ResultView(currentComputation : currentComputation,mainResult: mainResult)
                
                Spacer()
                
                CalcButtonView(currentComputation: $currentComputation, mainResult: $mainResult)
            }
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
        
        
    }
}

#Preview {
    MainView()
}
