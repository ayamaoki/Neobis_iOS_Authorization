//
//  APIService.swift
//  Neobis_iOS_Authorization
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
}

struct NetworkManager {
    
    static func request<ResultType: Decodable>(
        urlString: String,
        method: HTTPMethod = .post,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        completion: @escaping (Result<ResultType, NetworkError>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
    
        do {
            if method == .post, let parameters = parameters {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            }
        } catch {
            completion(.failure(.requestFailed(error)))
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("StatusCode: \(httpResponse.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            if ResultType.self == String.self {
                if let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString as! ResultType))
                } else {
                    completion(.failure(.decodingFailed(NSError(domain: "YourDomain", code: 100, userInfo: nil))))
                }
                
            } else {
                
                do {
                    let decodedData = try JSONDecoder().decode(ResultType.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed(error)))
                }
            }
        }
        
        task.resume()
    }
}

