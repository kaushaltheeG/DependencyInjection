//
//  DependencyInjection.swift
//  DependencyInjectionBootcamp
//
//  Created by Kaushal Kumbagowdana on 6/8/23.
//

import SwiftUI


struct DependencyInjection: View {
    @StateObject private var vm = DependencyViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DependencyInjection_Previews: PreviewProvider {
    static var previews: some View {
        DependencyInjection()
    }
}
