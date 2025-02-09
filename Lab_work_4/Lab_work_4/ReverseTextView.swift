import SwiftUI

struct ReverseTextView: View {
    @State private var userInput: String = ""
    @State private var reversedText: String = ""
    var body: some View {
        VStack {
            TextField("Введите строку", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Инвертировать") {
                reversedText = String(userInput.reversed())
            }
            Text(reversedText)
                .font(.title3)
                .padding()
        }
    }
}
