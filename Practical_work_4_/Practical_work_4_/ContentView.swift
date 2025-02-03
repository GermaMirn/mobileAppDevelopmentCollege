import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""  // Строка для текста
    @State private var selectedDate: String?  // Строка для вывода даты
    @State private var selectedTime: String?  // Строка для вывода времени
    @State private var serverResponse: String = ""  // Ответ от сервера

    var body: some View {
        NavigationStack {
            VStack {
                // Текстовое поле
                TextField("Введите данные для отправки", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Кнопка для отправки данных на сервер
                Button("Отправить данные") {
                    sendDataToServer(inputText)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .foregroundColor(.white)

                // Показ ответа от сервера
                if !serverResponse.isEmpty {
                    Text("Ответ от сервера: \(serverResponse)")
                        .padding()
                        .foregroundColor(.green)
                }

                // Кнопка для перехода на экран времени
                NavigationLink("Выбрать время", value: "time")
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(.white)

                // Кнопка для перехода на экран даты
                NavigationLink("Выбрать дату", value: "date")
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                    .foregroundColor(.white)

                // Отображение выбранного времени или даты
                if let time = selectedTime {
                    Text("Время: \(time)")
                        .padding()
                }

                if let date = selectedDate {
                    Text("Дата: \(date)")
                        .padding()
                }
            }
            .navigationTitle("Главное окно")
            .navigationDestination(for: String.self) { value in
                // Переход в зависимости от значения
                switch value {
                case "time":
                    TimeView(time: $selectedTime)
                case "date":
                    DateView(date: $selectedDate)
                default:
                    EmptyView()
                }
            }
        }
    }

    // Функция для отправки данных на сервер
    func sendDataToServer(_ input: String) {
        Networking.sendDataToServer(input) { response in
            serverResponse = response
        }
    }
}
