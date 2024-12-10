//
//  CalcButtonModel.swift
//  Calculator
//
//  Created by Prinon bhowmik on 12/11/24.
//

import Foundation
import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigitsColor
}
