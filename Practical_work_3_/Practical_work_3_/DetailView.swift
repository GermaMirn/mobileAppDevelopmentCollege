import SwiftUI

struct DetailView: View {
    @EnvironmentObject var languageManager: LanguageManager
    let topicKey: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(getTopicContent())
                    .padding()
                    .font(.body)

                Divider()

                Text(languageManager.translate("examples"))
                    .font(.title2)
                    .bold()
                    .padding(.top)

                getExamples()
            }
            .padding()
        }
        .navigationTitle(languageManager.translate(topicKey))
    }

    func getTopicContent() -> String {
        switch topicKey {
        case "qualifiers":
            return languageManager.currentLanguage == "ru"
                ? "В iOS используются Size Classes, Dynamic Type, Localization и другие механизмы."
                : "iOS uses Size Classes, Dynamic Type, Localization, and other mechanisms."
        case "layouts":
            return languageManager.currentLanguage == "ru"
                ? "Основные виды расположений: UIStackView, Auto Layout, Frame-based layout."
                : "Basic layout types: UIStackView, Auto Layout, Frame-based layout."
        default:
            return ""
        }
    }

    @ViewBuilder
    func getExamples() -> some View {
        switch topicKey {
        case "qualifiers":
            SizeClassesExample()
            DynamicTypeExample()
            LocalizationExample()
        case "layouts":
            UIStackViewExample()
            AutoLayoutExample()
            FrameBasedLayoutExample()
        default:
            EmptyView()
        }
    }
}

#Preview {
    DetailView(topicKey: "qualifiers").environmentObject(LanguageManager())
}










struct SizeClassesExample: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        VStack {
            Text("Size Classes Example")
                .font(.headline)
            
            if horizontalSizeClass == .compact {
                Text("Компактный режим (Compact)")
                    .foregroundColor(.blue)
            } else {
                Text("Обычный режим (Regular)")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}


struct DynamicTypeExample: View {
    var body: some View {
        VStack {
            Text("Dynamic Type Example")
                .font(.headline)

            Text("Этот текст адаптируется под настройки размера шрифта.")
                .font(.body)
                .padding()
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(10)
        }
        .padding()
    }
}


struct LocalizationExample: View {
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack {
            Text("Localization Example")
                .font(.headline)

            Text(languageManager.translate("language"))
                .padding()
                .background(Color.orange.opacity(0.3))
                .cornerRadius(10)
        }
        .padding()
    }
}


struct UIStackViewExample: View {
    var body: some View {
        VStack {
            Text("UIStackView (VStack в SwiftUI)")
                .font(.headline)

            HStack {
                Text("🔵").font(.largeTitle)
                Text("🟢").font(.largeTitle)
                Text("🔴").font(.largeTitle)
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
        }
        .padding()
    }
}


struct AutoLayoutExample: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Auto Layout (GeometryReader в SwiftUI)")
                    .font(.headline)

                Text("Ширина экрана: \(Int(geometry.size.width)) px")
                    .padding()
                    .background(Color.purple.opacity(0.3))
                    .cornerRadius(10)
            }
            .frame(width: geometry.size.width)
        }
        .padding()
    }
}


struct FrameBasedLayoutExample: View {
    var body: some View {
        VStack {
            Text("Frame-Based Layout")
                .font(.headline)

            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 50)
                .overlay(Text("100x50").foregroundColor(.white))
                .cornerRadius(8)
        }
        .padding()
    }
}
