import SwiftUI

struct ContentView: View {
    @State private var name: String = "" // Для текущего ввода
    @State private var names: [String] = [] // Список имен
    @State private var editingIndex: Int? = nil // Индекс редактируемого элемента
    @State private var message: String? = nil // Сообщение о последнем действии

    var body: some View {
        VStack(spacing: 16) {
            if let message = message {
                Text(message)
                    .foregroundColor(.green)
            }

            HStack {
                TextField("Введите имя", text: $name)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity)
                
                Button(action: {
                    if !name.isEmpty {
                        if let index = editingIndex, index < names.count {
                            names[index] = name
                            message = "Сохранено: \(name)"
                            editingIndex = nil
                        } else {
                            names.append(name)
                            message = "Добавлено: \(name)"
                        }
                        name = ""
                    }
                }) {
                    Text(editingIndex == nil ? "Добавить" : "Сохранить")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            .padding()

            List {
                ForEach(names.indices, id: \.self) { index in
                    HStack {
                        if editingIndex == index {
                            TextField("Редактировать имя", text: $name)
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            Button(action: {
                                editingIndex = nil
                                name = ""
                                message = "Отмена редактирования"
                            }) {
                                Text("Отмена")
                                    .foregroundColor(.red)
                            }
                            .padding(.leading, 8)
                            
                        } else {
                            Text(names[index])
                            Spacer()
                            Button(action: {
                                if index < names.count {
                                    name = names[index]
                                    editingIndex = index
                                    message = nil
                                }
                            }) {
                                Text("Изменить")
                                    .foregroundColor(.blue)
                            }
                            .padding(.trailing, 8)
                        }

                        Button(action: {
                            if index < names.count {
                                names.remove(at: index)
                                if editingIndex == index {
                                    editingIndex = nil
                                    name = ""
                                }
                                message = "Удалено"
                            }
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
