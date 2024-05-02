//
//  ContentView.swift
//  FourColoredCircles
//
//  Created by Tanner King on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    let shapes = [ "Circle", "Square", "Triangle", "Star"]
    let colors = ["Blue", "Light Blue", "Red", "Yellow", "Pink", "Purple", "Light Purple", "Green", "Light Green", "Black", "Brown",  ]
    let animals = ["Horse", "Sheep", "Cow","Duck", "Chicken", "Goat", "Elephant", "Pig", "Dog", "Cat"]
    @State var animalMode = false
    @State var animal = "Horse"
    @State var shape = "Circle"
    @State var color = "Blue"
    @State var number = 1
    @State var showingSheet = false
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Animal Mode")){
                    Toggle( isOn: $animalMode, label: {
                        Text("Animal Mode")
                    })
                }
                if !animalMode {
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

                            Stepper("Number of shapes:  \(number)", value: $number, in: 1...12)
                        }
                    }
                } else {
                    Section(header: Text("Animal Info")) {
                        VStack {
                            Picker("Pick an animal", selection: $animal) {
                                ForEach(animals, id: \.self) {
                                    Text($0)
                                }
                            }
                            Stepper("Number of shapes:  \(number)", value: $number, in: 1...12)
                        }
                    }
                }

                Section(header: Text("Make \(animalMode ? "Animals": "Shapes")")) {
                    Button("Make \(animalMode ? "Animals": "Shapes")") {
                        showingSheet.toggle()
                    }
                }

                Section(header: Text("Random \(animalMode ? "Animals": "Shapes")")) {
                    Button("Random \(animalMode ? "Animals": "Shapes")") {
                        color = colors[Int.random(in: 0...7)]
                        shape = shapes[Int.random(in: 0...3)]
                        number = Int.random(in: 1...12)

                        animal = animals[Int.random(in: 0...5)]

                        showingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingSheet, content: {
                if animalMode{
                    AnimalView(animal: animal, number: number)
                } else {
                    ShapeView(shape: shape, color: color, number: number)
                }
            })
            .navigationTitle("Four Colored Circles")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
