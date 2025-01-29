import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @State private var input: String = ""
    
    var body: some View {
        VStack {
            // Текст с правильным склонением слова "раз"
            Text("Кнопка нажата \(count) \(getCorrectWord(for: count))")
                .font(.title)
                .padding()
            
            HStack {
                // Кнопка "-1"
                Button(action: {
                    count -= 1
                }) {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.red)
                }
                .padding()
                
                // Кнопка "+1"
                Button(action: {
                    count += 1
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.green)
                }
                .padding()
            }
            
            // Кнопка сброса
            Button(action: {
                count = 0
            }) {
                Text("Сбросить")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Divider()
                .padding()
            
            // Калькулятор
            TextField("Введите число", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)
            
            HStack {
                Button("7") { input.append("7") }
                Button("8") { input.append("8") }
                Button("9") { input.append("9") }
                Button("+") { input.append("+") }
            }
            .buttonStyle(CalculatorButtonStyle())
            
            HStack {
                Button("4") { input.append("4") }
                Button("5") { input.append("5") }
                Button("6") { input.append("6") }
                Button("-") { input.append("-") }
            }
            .buttonStyle(CalculatorButtonStyle())
            
            HStack {
                Button("1") { input.append("1") }
                Button("2") { input.append("2") }
                Button("3") { input.append("3") }
                Button("*") { input.append("*") }
            }
            .buttonStyle(CalculatorButtonStyle())
            
            HStack {
                Button("0") { input.append("0") }
                Button("C") { input = "" }
                Button("=") { calculateResult() }
                Button("/") { input.append("/") }
            }
            .buttonStyle(CalculatorButtonStyle())
        }
    }
    
    func getCorrectWord(for number: Int) -> String {
        let lastDigit = number % 10
        let lastTwoDigits = number % 100
        
        if lastTwoDigits >= 11 && lastTwoDigits <= 14 {
            return "раз"
        }
        switch lastDigit {
        case 1: return "раз"
        case 2, 3, 4: return "раза"
        default: return "раз"
        }
    }
    
    func calculateResult() {
        let expression = NSExpression(format: input)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            input = result.stringValue
        }
    }
}

// Стили кнопок для калькулятора
struct CalculatorButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 60, height: 60)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(5)
    }
}
