import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var message: String = ""
    var onLoginSuccess: (String) -> Void

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("E-mail")
                    .font(.title)
                    .padding(.horizontal)
                TextField("Введите e-mail", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Пароль")
                    .font(.title)
                    .padding(.horizontal)
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }

            Button(action: {
                handleLogin()
            }) {
                Text("Войти")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)

            Button(action: {
                handleSend()
            }) {
                Text("Отправить")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)

            Text(message)
                .foregroundColor(.red)
                .padding(.top)
        }
        .padding()
    }

    private func handleLogin() {
        if email == "admin@admin.ru" && password == "123" {
            onLoginSuccess("Добро пожаловать, \(email)!")
        } else {
            message = "Ошибка авторизации."
        }
    }

    private func handleSend() {
        onLoginSuccess("Вы отправили e-mail: \(email)")
    }
}
