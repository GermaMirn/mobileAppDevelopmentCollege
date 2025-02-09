import SwiftUI

struct GuessNumberView: View {
    @State private var randomNumber: Int = Int.random(in: 1...100)
    @State private var userGuess: String = ""
    @State private var resultText: String = ""
    @State private var resultColor: Color = .black
    
    var body: some View {
        VStack {
            Text("Угадай число")
                .font(.headline)
            TextField("Введите число", text: $userGuess)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Попробовать угадать") {
                if let guess = Int(userGuess) {
                    if guess == randomNumber {
                        resultText = "Ты угадал!"
                        resultColor = .green
                    } else {
                        resultText = "Не угадал. Загаданное число было \(randomNumber)"
                        resultColor = .red
                    }
                }
            }
            Text(resultText)
                .foregroundColor(resultColor)
                .font(.title2)
                .padding()
        }
        .padding()
    }
}
