//
//  Configurator.swift
//  SU02
//
//  Created by Anna Ershova on 15.01.2022.
//

import Foundation

public class Configurator {
    public static let shared = Configurator()
    
    public init() {}
    
    public func register() {
        ServiceLocator.shared.addServices(service: NewsService())
    }
}
