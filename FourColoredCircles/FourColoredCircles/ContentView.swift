//
//  ContentView.swift
//  FourColoredCircles
//
//  Created by Tanner King on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    let shapes = [ "Circle", "Square", "Triangle", "Star"]
    let colors = ["Blue", "Red", "Yellow", "Pink", "Purple", "Green", "Black"]
    @State var shape = "Circle"
    @State var color = "Blue"
    @State var number = 1
    @State var showShapes = false
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Shape Info")) {
                    VStack {
                        Picker("Pick a shape.", selection: $shape) {
                            ForEach(shapes, id: \.self) {
                                Text($0)
                            }
                        }

                        Picker("Pick a color", selection: $color) {
                            ForEach(colors, id: \.self) {
                                Text($0)
                            }
                        }

                        Stepper("Number of shapes:  \(number)", value: $number, in: 1...10)
                    }
                    .padding()
                }
                Section(header: Text("Make an image")) {
                    NavigationLink(destination: ShapeView(shape: shape, color: color, number: number)) {
                        Text("Make some shapes")
                }
                }
            }
            .navigationTitle("FourColoredCircles")
        }
    }
}

#Preview {
    ContentView()
}
