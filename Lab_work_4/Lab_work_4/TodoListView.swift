import SwiftUI

struct TodoListView: View {
    @State private var completedTask: String = ""
    var body: some View {
        VStack {
            Text("Список дел")
                .font(.headline)
            
            ToggleTask(title: "Сходить в магазин", completedTask: $completedTask)
            ToggleTask(title: "Пообедать", completedTask: $completedTask)
            ToggleTask(title: "Дочитать книгу", completedTask: $completedTask)
            
            Text(completedTask)
                .font(.headline)
                .padding()
        }
    }
}
