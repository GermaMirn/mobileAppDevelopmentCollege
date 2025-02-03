import SwiftUI

struct TimeView: View {
    @Binding var time: String?

    var body: some View {
        VStack {
            Text("Текущее время:")
                .font(.largeTitle)

            Text(getCurrentTime())
                .font(.title)
                .padding()
        }
        .navigationTitle("Выбор времени")
    }

    // Получаем текущее время
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: Date())
    }
}
