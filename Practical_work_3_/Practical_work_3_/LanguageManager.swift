import Foundation

class LanguageManager: ObservableObject {
    @Published var currentLanguage: String = "ru"

    let translations: [String: [String: String]] = [
        "ru": [
            "title": "Темы",
            "qualifiers": "Виды квалификаторов",
            "layouts": "Основные виды расположения",
            "language": "Переключение языка"
        ],
        "en": [
            "title": "Topics",
            "qualifiers": "Types of Qualifiers",
            "layouts": "Basic Layout Types",
            "language": "Language Switch"
        ]
    ]

    func translate(_ key: String) -> String {
        return translations[currentLanguage]?[key] ?? key
    }

    func toggleLanguage() {
        currentLanguage = (currentLanguage == "ru") ? "en" : "ru"
    }
}
