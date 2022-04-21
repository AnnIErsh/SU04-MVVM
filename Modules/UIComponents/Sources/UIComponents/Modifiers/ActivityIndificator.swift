//
//  ActivityIndificator.swift
//  SU02
//
//  Created by Anna Ershova on 29.12.2021.
//

import SwiftUI

public struct ActivityIndificator: ViewModifier {
    public var isLoading: Bool
    
    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    public func body(content: Content) -> some View {
        if isLoading {
            withLoading(content: content)
        } else {
            withoutLoading(content: content)
        }
    }
    
    func withoutLoading(content: Content) -> some View {
        content
    }
    
    func withLoading(content: Content) -> some View {
        print("withLoading")
        return VStack {
            content
            Divider()
            HStack {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
        }
    }
}
