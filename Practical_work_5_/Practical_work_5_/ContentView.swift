import SwiftUI

struct ContentView: View {
    @State private var answerText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ОС Android основана на ядре Linux")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 20) {
                Button(action: {
                    answerText = "Верно!"
                }) {
                    Text("Да")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    answerText = "Неверно:("
                }) {
                    Text("Нет")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Text(answerText)
                .font(.title2)
                .foregroundColor(.blue)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
