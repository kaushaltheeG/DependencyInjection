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
    3. Can customize init
    4. Cannot swap out services
 */

class PostService {
    
    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")! // unwraping the data; bad practice
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
