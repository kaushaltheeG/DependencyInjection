//
//  DependencyViewModel.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import Foundation

class DependencyViewModel: ObservableObject {
    
    @Published var dataArray: [PostModel] = []

    init() {
        loadPosts()
    }
    
    private func loadPosts() {
        
    }
}
