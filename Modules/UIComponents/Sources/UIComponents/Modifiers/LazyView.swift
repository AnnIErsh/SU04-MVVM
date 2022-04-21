//
//  LazyView.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
        
    }
    
    public var body: Content {
        build()
    }
}
