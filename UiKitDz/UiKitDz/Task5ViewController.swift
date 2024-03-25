// Task5ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class Task5ViewController: UIViewController {
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let result = try await fetchMessagesResult()
                print(result)
            } catch {
                print(error)
            }
        }
    }
    //    func fetchMessagesResult() async -> [Message] {
    //        return await withCheckedContinuation { continuation in
    //            NetworkService().fetchMessages(completion: { result in
    //                continuation.resume(returning: result)
    //            })
    //        }
    //    }
    //    }
    func fetchMessagesResult() async throws -> [Message] {
        return try await withCheckedThrowingContinuation { continuation in
            NetworkService().fetchMessages(completion: { result in
                if result.isEmpty {
                    continuation.resume(throwing: ErrorTypes.error)
                } else {
                    continuation.resume(returning: result)
                }
            })
        }
    }
}
enum ErrorTypes: Error {
    case error
}
struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkService {
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }
            
            completion([])
        }
        .resume()
    }
}
