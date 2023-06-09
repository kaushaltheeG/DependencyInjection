//
//  DependencyViewModel.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import Foundation
import Combine

class DependencyViewModel: ObservableObject {
    
    @Published var dataArray: [PostModel] = []
    private var cancellables = Set<AnyCancellable>()
    let postService: PostService
    
    init(postService: PostService) { // <-- the dependencies required for the class
        self.postService = postService
        loadPosts()
    }
    
    private func loadPosts() {
        postService.getData()
            .sink(receiveCompletion: { _ in
            }, receiveValue: { [weak self]  postsArray in
                self?.dataArray = postsArray
            })
            .store(in: &cancellables)
    }
}
