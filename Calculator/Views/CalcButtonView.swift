
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
                                buttonPressed(calcButton: buttonModel.calcButton)
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
        
        func buttonPressed(calcButton: CalcButton){
            switch calcButton {
            case .clear:
                currentComputation = ""
                mainResult = "0"
                
            case .equal, .negative:
                if !currentComputation.isEmpty{
                    if !lastCharIsDigitOperator(str: currentComputation){
                        let sign = calcButton == .negative ?  -1.0 : 1.0
                        
                        mainResult = formatResult(val: sign * calculateResult())
                        
                        if calcButton == .negative {
                            currentComputation = mainResult
                        }
                    }
                }
            case .decimal:
                print("")
                
            case .percent:
                if lastCharIsDigit(str: currentComputation){
                    currentComputation += calcButton.rawValue
                }
                
            case .undo:
                currentComputation = String(currentComputation.dropLast())
                
            case .add, .subtract, .divide, .multiply:
                if lastCharIsDigitOrPercent(str: currentComputation){
                    currentComputation += calcButton.rawValue
                }else{
                    currentComputation = String(currentComputation.dropLast())
                    currentComputation += calcButton.rawValue
                }
                
            default:
                
                currentComputation += calcButton.rawValue
                
            }
        }
        
        func calculateResult() -> Double {
            let visibleCalculate: String = currentComputation
            
            var calculate = visibleCalculate
            calculate = visibleCalculate.replacingOccurrences(of: "%", with: "*0.01")
            calculate = visibleCalculate.replacingOccurrences(of: multiplySymbol, with: "*")
            calculate = visibleCalculate.replacingOccurrences(of: divisionSymbol, with: "/")
            
            if getLastChar(str: visibleCalculate) == "." {
                calculate += "0"
            }
            
            let expr = NSExpression(format: calculate)
            let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
            
            return exprValue
        }
    }

    #Preview {
        CalcButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
    }
