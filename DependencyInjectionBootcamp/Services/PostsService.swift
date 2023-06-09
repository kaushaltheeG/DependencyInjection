//
//  PostsService.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import Foundation
import Combine

class PostsService {
    // Singleton
    static let instance = PostsService()
    
    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")! // unwraping the data; bad practice
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
