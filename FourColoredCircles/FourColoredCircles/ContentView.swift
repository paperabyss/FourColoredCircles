//
//  ContentView.swift
//  FourColoredCircles
//
//  Created by Tanner King on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    let shapes = [ "Circle", "Square", "Triangle", "Star"]
    let colors = ["Blue", "Red", "Yellow", "Pink", "Purple", "Green", "Black", "Brown"]
    @State var shape = "Circle"
    @State var color = "Blue"
    @State var number = 1
    @State var showingShapes = false
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

                Section(header: Text("Make Shapes")) {
                    Button("Make Shapes") {
                        showingShapes.toggle()
                    }
                }

                Section(header: Text("Make Random Shapes")) {
                    Button("Make Random Shapes") {
                        color = colors[Int.random(in: 0...7)]
                        shape = shapes[Int.random(in: 0...3)]
                        number = Int.random(in: 1...12)

                        showingShapes.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingShapes, content: {
                ShapeView(shape: shape, color: color, number: number)
            })
            .navigationTitle("FourColoredCircles")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
