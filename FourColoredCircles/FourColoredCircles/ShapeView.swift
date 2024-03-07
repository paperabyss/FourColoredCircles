//
//  ShapeView.swift
//  FourColoredCircles
//
//  Created by Tanner King on 3/7/24.
//

import SwiftUI

struct ShapeView: View {
    let shape: String
    let color: String
    let number: Int

    var shapeColor: Color {
        switch color {
        case "blue":
            return .blue

        case "red":
            return .red

        default:
            return .black
        }
    }

    var body: some View {
        Image(systemName: "\(shape).fill")
            .resizable()
            .foregroundStyle(shapeColor)
            .frame(width: 100, height: 100)
            .background()
    }
}

#Preview {
    ShapeView(shape: "circle", color: "red", number: 3)
}
