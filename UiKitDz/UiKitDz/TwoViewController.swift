// TwoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
class TwoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let asyncWorker = AsyncWorker()
        DispatchQueue.main.async {
            asyncWorker.doJobs(postNumbers: 1, 2, 3, 4, 5) { posts in
                print(Thread.current)
                print(posts.map(\.id))
            }
        }
    }
}

class AsyncWorker {
    let dispathgroop = DispatchGroup()
    func doJobs(postNumbers: Int..., completion: @escaping ([Post]) -> Void) {
        var posts = [Post]()

        for i in postNumbers {
            dispathgroop.enter()
            URLSession.shared
                .dataTask(with: URLRequest(
                    url: URL(string: "https://jsonplaceholder.typicode.com/todos/\(i)")!
                )) { data, response, error in
                    guard let data = data else {
                        return
                    }
                    if let post = try? JSONDecoder().decode(Post.self, from: data) {
                        posts.append(post)
                    }
                    self.dispathgroop.leave()
                }
                .resume()
        }
        dispathgroop.notify(queue: .main) {
            completion(posts)
        }
    }
}

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
