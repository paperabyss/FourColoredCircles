//
//  AnimalView.swift
//  FourColoredCircles
//
//  Created by Tanner King on 5/2/24.
//

import SwiftUI

struct AnimalView: View {
    @Environment(\.dismiss) var dismiss
    let animal: String
    let number: Int

    var animalImage: String {
        switch animal {
        case "Horse":
            return "🐎"
        case "Cow":
            return "🐄"
        case "Chicken":
            return "🐓"
        case "Duck":
            return "🦆"
        case "Sheep":
            return "🐑"
        case "Goat":
            return "🐐"
        default:
            return "🦄"
        }
    }

    var body: some View {
        Spacer()
        Text(number > 1 ? "What are they?" : "What is it?")
            .font(.title)
        LazyVGrid(columns: [GridItem(.adaptive(minimum: CGFloat(100)))]){
            ForEach(0..<number) { _ in
                Text(animalImage)
                    .font(.system(size: 90))
                    .minimumScaleFactor(0.1)
            }
        }
        .padding()
        Spacer()
        Button("Make More") {
                    dismiss()
                }
        Spacer()
    }
}

#Preview {
    AnimalView(animal: "Horse", number: 10)
}
