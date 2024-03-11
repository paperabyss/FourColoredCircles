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
        case "Blue":
            return .blue

        case "Red":
            return .red

        case "Yellow":
            return .yellow

        case "Pink":
            return .pink

        case "Purple":
            return .purple

        case "Green":
            return .green

        case "Black":
            return .black

        case "Brown":
            return .brown

        default:
            return .black
        }
    }

    var body: some View {
        Text(number > 1 ? "What are they?" : "What is it?")
            .font(.title)
        LazyVGrid(columns: [GridItem(.adaptive(minimum: CGFloat(100)))]){
            ForEach(0..<number) { _ in
                Image(systemName: "\(shape.lowercased()).fill")
                    .resizable()
                    .foregroundStyle(shapeColor)
                    .frame(width: 100, height: 100)
                    .background()
            }
        }
        .padding()
    }
}

#Preview {
    ShapeView(shape: "circle", color: "red", number: 3)
}
