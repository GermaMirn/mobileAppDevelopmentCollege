import SwiftUI

struct ToggleTask: View {
    let title: String
    @Binding var completedTask: String
    @State private var isCompleted: Bool = false
    
    var body: some View {
        Toggle(title, isOn: $isCompleted)
            .onChange(of: isCompleted) {
                completedTask = isCompleted ? "Вы сделали задание: \(title)" : ""
            }
    }
}
