import SwiftUI

struct DateView: View {
    @Binding var date: String?

    var body: some View {
        VStack {
            Text("Текущая дата:")
                .font(.largeTitle)

            Text(getCurrentDate())
                .font(.title)
                .padding()
        }
        .navigationTitle("Выбор даты")
    }

    // Получаем текущую дату
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}
