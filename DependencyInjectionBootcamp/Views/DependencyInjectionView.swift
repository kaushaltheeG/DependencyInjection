//
//  DependencyInjection.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import SwiftUI


struct DependencyInjectionView: View {
    @StateObject private var vm: DependencyViewModel
    
    init(postService: PostService) {
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
        postService depencies should be initlized at the start of the app be and be passed around to needed components
        - Thhey will be injected into all the views or ViewModels that depend on them     */
    static let postService = PostService()
    
    static var previews: some View {
        DependencyInjectionView(postService: postService)
    }
}
