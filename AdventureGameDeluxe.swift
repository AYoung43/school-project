import SwiftUI
struct ContentView: View {
    // Game state
    @State private var currentStep = "start"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            switch currentStep {
            case "start":
                Text("You are getting ready to play a Tennis match.")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("Warm Up") {
                        currentStep = "path"
                    }
                    gameButton("Skip the warm up, I'm ready to play!") {
                        currentStep = "stay"
                    }
                }
            case "path":
                Text("After the warm up, you get ready to play the match proper.")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("Serve first") {
                        currentStep = "cave"
                    }
                    gameButton("Serve second") {
                        currentStep = "bridge"
                    }
                    gameButton("Forfeit") {
                        currentStep = "river"
                    }
                }
            case "stay":
                Text("Lack of preperation puts you at quite the disadvantage. You lost.")
                gameButton("Casually Reset Time") {
                    currentStep = "start"
                }
            case "cave":
                Text("You win!")
                gameButton("Reset time anyway") {
                    currentStep = "path"
                }
            case "bridge":
                Text("It's a close match, but the opponent has slightly better momentum. You lost, but don't feel too down.")
                gameButton("...Now that's just lazy writing, restart!") {
                    currentStep = "start"
                }
            case "river":
                Text("...Ok, I, wow. Well, dunno what you were expecting. Do you even need clarification you lost?")
                gameButton("Casually Reset Time") {
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
    // Reusable styled button
    func gameButton(_ label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
#Preview {
    ContentView()
}

