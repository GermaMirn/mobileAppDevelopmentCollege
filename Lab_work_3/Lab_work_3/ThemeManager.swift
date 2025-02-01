import SwiftUI

enum AppTheme: String, CaseIterable {
    case light, dark, custom

    var colorScheme: ColorScheme {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .custom: return .light
        }
    }

    var backgroundColor: Color {
        switch self {
        case .light:
            return Color(.systemBackground)
        case .dark:
            return Color(UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1))
        case .custom:
            return Color.yellow.opacity(0.2)
        }
    }

    var textColor: Color {
        switch self {
        case .light:
            return Color.primary
        case .dark:
            return Color(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1))
        case .custom:
            return Color.blue
        }
    }

    var buttonColor: Color {
        switch self {
        case .light:
            return Color.blue
        case .dark:
            return Color(UIColor(red: 44/255, green: 44/255, blue: 44/255, alpha: 1))
        case .custom:
            return Color.orange
        }
    }

    var cardBackground: Color {
        switch self {
        case .light:
            return Color(UIColor.systemGray6)
        case .dark:
            return Color(UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1))
        case .custom:
            return Color.yellow.opacity(0.4)
        }
    }
}

class ThemeManager: ObservableObject {
    @Published var selectedTheme: AppTheme = .light
}
