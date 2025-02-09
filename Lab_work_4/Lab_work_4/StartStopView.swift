import SwiftUI

struct StartStopView: View {
    @State private var buttonText: String = "Старт"
    @State private var isRecording: Bool = false
    
    var body: some View {
        VStack {
            Button(buttonText) {
                isRecording.toggle()
                buttonText = isRecording ? "Стоп" : "Старт"
                print(isRecording ? "Запись пошла..." : "Запись остановлена...")
            }
        }
    }
}
