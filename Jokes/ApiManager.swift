//
//  ApiManager.swift
//  Jokes
//
//  Created by Алексей Каземиров on 4/17/22.
//

import Foundation

enum ApiType {
    
    case login
    case getUsers
    case getJokes
    
    var baseUrl: String {
        //return "https://jsonplaceholder.typicode.com/"
        return "https://v2.jokeapi.dev/joke/"
    }
    
//    var headers: [String: String] {
//        switch self {
//        case .login:    return ["authToken": "12345"]
//        default:        return [:]
//        }
//    }
    
    var path: String {
        switch self {
        case .login:     return "login"
        case .getUsers:  return "users"
        case .getJokes:  return "Any?blacklistFlags=racist"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: baseUrl + path)!
        let request = URLRequest(url: url)
        return request
//        request.allHTTPHeaderFields = headers
//        switch self {
//        case .login:
//            request.httpMethod = "POST"
//            return request
//        default:
//            request.httpMethod = "GET"
//            return request
//        }
    }
}

class ApiManager {
    static let shared = ApiManager()
    
    func getUsers(completion: @escaping (Users) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data) {
                completion(users)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
    func getAnyJoke(completion: @escaping (Joke) -> Void) {
        let request = ApiType.getJokes.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
//            guard let data = data else { return }
//                        guard error == nil else { return }
//                        print(data)
//
//                        do {
//                            let decoder = JSONDecoder()
//                            let track = try decoder.decode(Joke.self, from: data)
//                            print(track)
//                        }
//                        catch let error {
//                            print("Error:", error)
//                        }
            if let data = data, let jokes = try? JSONDecoder().decode(Joke.self, from: data) {
                completion(jokes)
            }
        }
        task.resume()
    }
}
