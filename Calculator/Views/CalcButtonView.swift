
import SwiftUI

struct CalcButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [RowOfCalcButtonModel] = [
        RowOfCalcButtonModel(
            row: [CalcButtonModel(calcButton: .clear ,color: foregroundTopButtonsColor),
                  CalcButtonModel(calcButton: .negative ,color: foregroundTopButtonsColor),
                  CalcButtonModel(calcButton: .percent ,color: foregroundTopButtonsColor),
                  CalcButtonModel(calcButton: .divide ,color: foregroundRightButtonsColor)
                                  ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .seven),
            CalcButtonModel(calcButton: .eight),
            CalcButtonModel(calcButton: .nine),
            CalcButtonModel(calcButton: .multiply,
                            color: foregroundRightButtonsColor
                           )
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .four),
            CalcButtonModel(calcButton: .five),
            CalcButtonModel(calcButton: .six),
            CalcButtonModel(calcButton: .subtract,
                            color: foregroundRightButtonsColor
                           )
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .one),
            CalcButtonModel(calcButton: .two),
            CalcButtonModel(calcButton: .three),
            CalcButtonModel(calcButton: .add,
                            color: foregroundRightButtonsColor
                           )
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .undo),
            CalcButtonModel(calcButton: .zero),
            CalcButtonModel(calcButton: .decimal),
            CalcButtonModel(calcButton: .equal,
                            color: foregroundRightButtonsColor
                           )
        ])
        
    ]
    
    var body: some View {
        Grid(){
            ForEach(buttonData){ rowOfButton in
                GridRow{
                    ForEach(rowOfButton.row){ buttonModel in
                        
                        Button(action: {
                            
                        },label: {
                            ButtonView(calcButton: buttonModel.calcButton, fgColor: buttonModel.color, bgColor: buttonBackgroundColor)
                        })
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(20))
            
    }
}

#Preview {
    CalcButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
}
