//
//  ContentView.swift
//  AdventureGame
//
//  Created by Yunting Yin on 6/16/25.
//

import SwiftUI
struct ContentView: View {
    // Game state
    @State private var currentStep = "start"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // Display based on the current step
            switch currentStep {
            case "start":
                Text("🏞️ You're in a forest. You see a path ahead.")
                    .multilineTextAlignment(.center)
                HStack {
                    Button("Take the Path") {
                        currentStep = "path"
                    }
                    Button("Stay Put") {
                        currentStep = "stay"
                    }
                }
            case "path":
                Text("🌉 You find a bridge and a cave.")
                    .multilineTextAlignment(.center)
                HStack {
                    Button("Enter Cave") {
                        currentStep = "cave"
                    }
                    Button("Cross Bridge") {
                        currentStep = "bridge"
                    }
                }
            case "stay":
                Text("⛺ You set up camp. A bear shows up!")
                Circle()
                    .fill(Color.brown)
                    .frame(width: 100, height: 100)
                Button("Run Away") {
                    currentStep = "start"
                }
            case "cave":
                Text("🕳️ It's dark and scary. A bat flies out!")
                Ellipse()
                    .fill(Color.gray)
                    .frame(width: 120, height: 60)
                Button("Retreat") {
                    currentStep = "path"
                }
            case "bridge":
                Text("🌈 You cross the bridge and find treasure!")
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                Button("Restart Game") {
                    currentStep = "start"
                }
            default:
                Text("Game Over.")
            }
            Spacer()
        }
        .padding()
        .font(.title3)
    }
}
#Preview {
    ContentView()
}
