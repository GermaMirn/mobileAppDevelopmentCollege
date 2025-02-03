import Foundation

class Networking {
    static func sendDataToServer(_ input: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion("Некорректный URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Делаем запрос
        let body: [String: Any] = [
            "title": input,
            "body": input,
            "userId": 1
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.httpBody = jsonData
        } catch {
            completion("Ошибка при создании тела запроса: \(error)")
            return
        }

        // Отправка запроса
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion("Ошибка: \(error.localizedDescription)")
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion("Не получен ответ от сервера.")
                }
                return
            }

            // Обработка ответа от сервера
            if let responseStr = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    completion(responseStr)
                }
            }
        }.resume()
    }
}
