//
//  PostsService.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import Foundation
import Combine

/*
 Problems with Singleton
    1. They are global which cause issues with big apps
    2. Cause issues when using different threads and these threads are accessing the same instance
        a. causes the app to crash
    3. Can't customize init
    4. Cannot swap out dependencies
 */

// all PostServices much conform to the PostSerivceProtocol
protocol PostServiceProtocol {
    func getData() -> AnyPublisher<[PostModel], Error>
}

// production service -> can have different services for QA, Testing, etc
class PostService: PostServiceProtocol {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

/*  Used for Testing and Developing reasons
    Devloping: can use mock data as a placeholder
*/

class MockPostService: PostServiceProtocol {
    
    let testData: [PostModel] = [
        PostModel(userId: 1, id: 1, title: "Mock One", body: "mock one"),
        PostModel(userId: 2, id: 2, title: "Mock Two", body: "mock two")
    ]
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        // single publisher that pushes a single output
        Just(testData) // Just never fails but out getDat expects a possble error
            .tryMap({ $0 }) // tryMap tricks compiler that Just may be a possible error
            .eraseToAnyPublisher()
    }
}


