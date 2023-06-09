//
//  Post.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import Foundation

struct PostModel: Codable, Identifiable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
