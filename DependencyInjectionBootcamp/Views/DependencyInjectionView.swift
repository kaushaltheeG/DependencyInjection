//
//  DependencyInjection.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import SwiftUI


struct DependencyInjectionView: View {
    @StateObject private var vm: DependencyViewModel
    
    init(postService: PostServiceProtocol) {
        _vm = StateObject(wrappedValue: DependencyViewModel(postService: postService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct DependencyInjection_Previews: PreviewProvider {
    /*
     THIS IS THE START OF THE POSTSERVICE INJECTION
    */
    /*
        postService depencies should be initlized at the start of the app be and be passed around to needed components
        - They will be injected into all the views or ViewModels that depend on them     */
    // Production
    static let postService = PostService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!) // should never unwrap in production app
    
    // Mock service
    static let mockPostService = MockPostService(data: nil)
    static var previews: some View {
        DependencyInjectionView(postService: mockPostService)
    }
}
