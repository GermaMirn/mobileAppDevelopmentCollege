import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Мирончук Герман Андреевич, 22ИСП5-о9, 2025")
                    .font(.headline)
                    .padding()
                
                NavigationLink("Угадай число", destination: GuessNumberView())
                NavigationLink("Перевёрнутое слово", destination: ReverseTextView())
                NavigationLink("Создать заказ", destination: OrderView())
                NavigationLink("Список дел", destination: TodoListView())
                NavigationLink("Старт/Стоп", destination: StartStopView())
                NavigationLink("Выбор цвета", destination: ColorPickerView())
            }
            .padding()
        }
    }
}
