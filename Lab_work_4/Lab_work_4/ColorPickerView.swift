import SwiftUI

struct ColorPickerView: View {
    @State private var selectedColor: Color = .black
    var body: some View {
        VStack {
            Text("Выберите цвет")
                .font(.headline)
            Picker("Выберите цвет", selection: $selectedColor) {
                Text("Красный").tag(Color.red)
                Text("Жёлтый").tag(Color.yellow)
                Text("Синий").tag(Color.blue)
            }
            .pickerStyle(MenuPickerStyle())
            
            Text("Цветной текст")
                .foregroundColor(selectedColor)
                .font(.title2)
        }
        .padding()
    }
}
